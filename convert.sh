#!/bin/bash

set -euo pipefail

rm -r png/
mkdir -p png/black png/white

for svgfile in svg/*.svg; do
  icon=$(basename $svgfile .svg)
  echo "$svgfile -w 512 -h 512 -e png/black/$icon.png"
done | inkscape --shell

for pngfile in png/black/*.png; do
  icon=$(basename $pngfile .png)
  convert $pngfile -negate png/white/$icon.png
done
