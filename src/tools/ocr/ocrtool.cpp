// SPDX-License-Identifier: GPL-3.0-or-later
// SPDX-FileCopyrightText: 2017-2019 Alejandro Sirgo Rica & Contributors

#include "ocrtool.h"
#include <QPainter>

OcrTool::OcrTool(QObject* parent)
  : AbstractTwoPointTool(parent)
{
    m_supportsDiagonalAdj = true;
}

QIcon OcrTool::icon(const QColor& background, bool inEditor) const
{
    Q_UNUSED(inEditor)
    return QIcon(iconPath(background) + "circle-outline.svg");
}
QString OcrTool::name() const
{
    return tr("Ocr");
}

CaptureTool::Type OcrTool::type() const
{
    return CaptureTool::TYPE_CIRCLE;
}

QString OcrTool::description() const
{
    return tr("Set the Ocr as the paint tool");
}

CaptureTool* OcrTool::copy(QObject* parent)
{
    auto* tool = new OcrTool(parent);
    copyParams(this, tool);
    return tool;
}

void OcrTool::process(QPainter& painter, const QPixmap& pixmap)
{
    Q_UNUSED(pixmap)
    painter.setPen(QPen(color(), size()));
    painter.drawEllipse(QRect(points().first, points().second));
}

void OcrTool::pressed(CaptureContext& context)
{
    Q_UNUSED(context)
}
