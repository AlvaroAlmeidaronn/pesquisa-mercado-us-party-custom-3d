#!/usr/bin/env bash
set -uo pipefail
ROOT="$(cd "$(dirname "$0")/.." && pwd)"
assets="$ROOT/landing/assets"
html="$ROOT/landing/index.html"
css="$ROOT/landing/styles.css"
pass=0
failn=0

check() {
  local name="$1"
  shift
  if "$@"; then
    echo "PASS $name"
    pass=$((pass + 1))
  else
    echo "FAIL $name"
    failn=$((failn + 1))
  fi
}

echo "=== VERIFY landing media set ==="
files=(
  hero-hand-figurine.jpg
  hero-studio-wash.jpg
  occasion-cake-topper.jpg
  occasion-shelf-keepsake.jpg
  mechanism-preview-craft.jpg
  studio-ambient-bg.jpg
  process-01-message.jpg
  process-02-photos.jpg
  process-03-preview.jpg
  process-04-handcraft.jpg
  spec-likeness.jpg
  spec-finish.jpg
  spec-dual.jpg
  spec-support.jpg
)

for f in "${files[@]}"; do
  check "file $f" test -s "$assets/$f"
  if file -b "$assets/$f" | grep -qi 'JPEG\|JFIF'; then
    echo "PASS jpeg magic $f"
    pass=$((pass + 1))
  else
    echo "FAIL jpeg magic $f ($(file -b "$assets/$f"))"
    failn=$((failn + 1))
  fi
done

for f in "${files[@]}"; do
  if grep -qF -e "$f" -- "$html" || grep -qF -e "$f" -- "$css"; then
    echo "PASS ref $f"
    pass=$((pass + 1))
  else
    echo "FAIL ref $f"
    failn=$((failn + 1))
  fi
done

check "hero wash in css" grep -qF -e "hero-studio-wash.jpg" -- "$css"
check "no decorative svg tags" bash -c "! grep -q '<svg' -- '$html'"
check "no diamond icon glyph" bash -c "! grep -q '✦' -- '$html'"
check "process thumbs wired" grep -qF -e "rail-card__img" -- "$html"
check "spec thumbs wired" grep -qF -e "spec-thumb" -- "$html"

total=$((pass + failn))
echo "SUMMARY ($pass,$total) FAILED=$failn"
echo "EXIT_CODE=$failn"
if [ "$failn" -eq 0 ]; then exit 0; else exit 1; fi
