#!/usr/bin/env bash

TMPDIR=$(mktemp -d -t ocr-XXXXXXXXXX)
trap "rm -rf $TMPDIR" EXIT

cd "$TMPDIR"
flameshot gui -r > img.png
tesseract img.png text
cat text.txt | xclip -selection clipboard 
notify-send "Copied: $(cat text.txt)"
