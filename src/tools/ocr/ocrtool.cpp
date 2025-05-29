// SPDX-License-Identifier: GPL-3.0-or-later
// SPDX-FileCopyrightText: 2017-2019 Alejandro Sirgo Rica & Contributors

#include "ocrtool.h"
#include <QApplication>
#include <QClipboard>
#include <QDebug>
#include <leptonica/allheaders.h>
#include <tesseract/baseapi.h>

OcrTool::OcrTool(QObject* parent)
  : AbstractActionTool(parent)
{}

bool OcrTool::closeOnButtonPressed() const
{
    return true;
}

QIcon OcrTool::icon(const QColor& background, bool inEditor) const
{
    Q_UNUSED(inEditor)
    return QIcon(iconPath(background) + "ocr.svg");
}

QString OcrTool::name() const
{
    return tr("OCR");
}

CaptureTool::Type OcrTool::type() const
{
    return CaptureTool::TYPE_OCR;
}

QString OcrTool::description() const
{
    return tr("Extract text from selection and copy to clipboard (O)");
}

CaptureTool* OcrTool::copy(QObject* parent)
{
    return new OcrTool(parent);
}

void OcrTool::pressed(CaptureContext& context)
{
    emit requestAction(REQ_CLEAR_SELECTION);

    QPixmap pixmapToProcess = context.selectedScreenshotArea();

    qDebug() << "OCR: Processing image size:" << pixmapToProcess.width() << "x"
             << pixmapToProcess.height();

    QString extractedText = performOCR(pixmapToProcess);

    if (!extractedText.isEmpty()) {
        QApplication::clipboard()->setText(extractedText);
        qDebug() << "OCR: Text copied to clipboard";
    } else {
        qDebug() << "OCR: No text found";
    }

    emit requestAction(REQ_CAPTURE_DONE_OK);
    emit requestAction(REQ_CLOSE_GUI);
}

QString OcrTool::performOCR(const QPixmap& pixmap)
{
    QImage image = pixmap.toImage();

    if (image.width() < 300 || image.height() < 100) {
        image = image.scaled(image.width() * 2,
                             image.height() * 2,
                             Qt::KeepAspectRatio,
                             Qt::SmoothTransformation);
    }

    image = image.convertToFormat(QImage::Format_Grayscale8);
    image = image.convertToFormat(QImage::Format_RGB888);

    image.setDotsPerMeterX(2835);
    image.setDotsPerMeterY(2835);

    tesseract::TessBaseAPI api;
    const char* languages = "eng+deu+fra+spa+chi_sim+jpn+ara+hin+rus";

    if (api.Init(nullptr, languages)) {
        if (api.Init(nullptr, "eng")) {
            qDebug() << "OCR: Failed to initialize Tesseract";
            return QString();
        }
        qDebug() << "OCR: Using English only";
    } else {
        qDebug() << "OCR: Using multilingual mode";
    }

    api.SetPageSegMode(tesseract::PSM_AUTO);

    api.SetVariable("debug_file", "/dev/null");

    api.SetImage(
      image.bits(), image.width(), image.height(), 3, image.bytesPerLine());

    char* outText = api.GetUTF8Text();
    QString result = QString::fromUtf8(outText);

    delete[] outText;
    api.End();

    return result.trimmed();
}
