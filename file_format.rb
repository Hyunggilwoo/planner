WEEKS = 1
HOUR_LABELS = [nil, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, nil, nil]
HOUR_COUNT = HOUR_LABELS.length
COLUMN_COUNT = 4
LIGHT_COLOR = 'AAAAAA'
MEDIUM_COLOR = '888888'
DARK_COLOR   = '000000'
DATE_LONG = "%B %-d, %Y"

UBUNTU_FONT_PATH = "/usr/share/fonts/truetype/ubuntu"
UBUNTU_MONO_R = "/UbuntuMono-R.ttf"
UBUNTU_MONO_RI = "/UbuntuMono-RI.ttf"
UBUNTU_MONO_B = "/UbuntuMono-B.ttf"
UBUNTU_C = "/Ubuntu-C.ttf"
FONTS = {
  'Ubuntu' => {
    normal: { file: UBUNTU_FONT_PATH + UBUNTU_MONO_R, font: 'Ubuntu-Mono-Regular' },
    italic: { file: UBUNTU_FONT_PATH + UBUNTU_MONO_RI, font: 'Ubuntu-Mono-Italics' },
    bold: { file: UBUNTU_FONT_PATH + UBUNTU_MONO_B, font: 'Ubuntu-Mono-Bold' },
    condensed: { file: UBUNTU_FONT_PATH + UBUNTU_C, font: 'Ubuntu Condensed' },
  }
}

FILE_NAME = "time_block_pages.pdf"

PAGE_SIZE = 'LETTER'
# Order is top, right, bottom, left
LEFT_PAGE_MARGINS = [36, 72, 36, 36]
RIGHT_PAGE_MARGINS = [36, 36, 36, 72]