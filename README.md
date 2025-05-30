# Flameshot OCR

**A fork of Flameshot with built-in OCR: Instantly extract and copy text from screenshots to your clipboard using Tesseract OCR.**

---

## Features

- Take screenshots and extract text from any region using Tesseract OCR
- Copy recognized text directly to your clipboard
- Works fully offline, all OCR is performed locally
- Supports multiple languages (if Tesseract language packs are installed)
- All core Flameshot screenshot and annotation features are preserved

---

## Usage

1. **Run Flameshot OCR:**

```bash
./build/src/flameshot
```
2. **Take a screenshot as usual (tray icon or hotkey).**
3. **Select the OCR tool** from the toolbar.
4. **Draw/select a region** containing text.
5. **Text is automatically copied to your clipboard.**

---

## Keyboard Shortcut (Linux)

To bind OCR capture to <kbd>Print Screen</kbd>:

- Go to **Settings → Keyboard → Shortcuts → Custom Shortcuts**
- Add a new shortcut with command:

```bash
flameshot gui
```

- Assign it to <kbd>Print Screen</kbd>

For best results, add `flameshot` to your startup applications so the daemon is running.

---

## Compilation

### **Dependencies**

- Qt >= 5.9
- GCC >= 7.4
- CMake >= 3.12
- Tesseract OCR (and language packs as needed)


#### **Ubuntu/Debian example:**

```bash
sudo apt update
sudo apt install g++ cmake build-essential qtbase5-dev qttools5-dev-tools libqt5svg5-dev \
libtesseract-dev libleptonica-dev tesseract-ocr
```


#### **Optional: Install extra language packs**

```bash
sudo apt-get install \
tesseract-ocr-deu \
tesseract-ocr-fra \
tesseract-ocr-spa \
tesseract-ocr-chi-sim \
tesseract-ocr-jpn \
tesseract-ocr-ara \
tesseract-ocr-hin \
tesseract-ocr-rus
```


### **Build**

```bash
git clone https://github.com/yourusername/flameshot-ocr.git
cd flameshot-ocr
mkdir build
cmake -S . -B build && cmake --build build --parallel
```


---

## Notes

- OCR language selection defaults to English. To use other languages, install the relevant Tesseract language packs.
- For best clipboard compatibility, run `flameshot` as a daemon and use the tray icon or hotkey.
  
---

## License

This project is licensed under GPLv3, same as the original Flameshot.

---


Refer to [the original Flameshot documentation](https://flameshot.org/docs/) for more details about flameshot.
