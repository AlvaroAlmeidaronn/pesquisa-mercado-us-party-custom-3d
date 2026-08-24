#!/usr/bin/env bash
set -uo pipefail
ROOT="$(cd "$(dirname "$0")/.." && pwd)"
css="$ROOT/landing/styles.css"
html="$ROOT/landing/index.html"
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

echo "=== VERIFY landing type+palette ==="
  for tok in --font-detail --on-accent --glow-amber --fig --fig-deep --hand --hand-2 --focus --sage-soft --wash-sage --shadow-ink --accent-btn --accent-btn-hover; do
  check "token $tok" grep -qF -e "$tok" -- "$css"
done
check "Fraunces in html" grep -qF -e "Fraunces" -- "$html"
check "Fraunces in css" grep -qF -e "Fraunces" -- "$css"
check "detail font applied" grep -qF -e "font-family: var(--font-detail)" -- "$css"
check "on-accent on btn" grep -qF -e "color: var(--on-accent)" -- "$css"
check "btn uses accent-btn" grep -qF -e "background: var(--accent-btn)" -- "$css"
check "focus is deep" grep -qF -e "--focus: #8a6418" -- "$css"
check "svg fig token" grep -qF -e 'fill="var(--fig)"' -- "$html"
if grep -E 'color: #fffaf3' -- "$css" >/dev/null; then
  echo "FAIL hardcoded on-accent hex remains"
  failn=$((failn + 1))
else
  echo "PASS no hardcoded #fffaf3"
  pass=$((pass + 1))
fi
count=$(grep -c '^\.micro {' -- "$css" || true)
if [ "$count" = "1" ]; then
  echo "PASS single .micro rule"
  pass=$((pass + 1))
else
  echo "FAIL .micro count=$count"
  failn=$((failn + 1))
fi

total=$((pass + failn))
echo "SUMMARY ($pass,$total) FAILED=$failn"
echo "EXIT_CODE=$failn"
if [ "$failn" -eq 0 ]; then exit 0; else exit 1; fi
