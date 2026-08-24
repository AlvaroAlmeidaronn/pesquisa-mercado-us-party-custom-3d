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

echo "=== VERIFY landing mobile UX ==="
check "mobile-bar-offset token" grep -qF -e "--mobile-bar-offset" -- "$css"
check "safe-area topbar" grep -qF -e "safe-area-inset-top" -- "$css"
check "safe-area mobile-bar" grep -qF -e "safe-area-inset-bottom" -- "$css"
check "viewport-fit cover" grep -qF -e "viewport-fit=cover" -- "$html"

if awk '
  /@media \(max-width: 767px\)/ { inmob=1 }
  inmob && /\.close \{/ { closeblk=1 }
  closeblk && /padding-bottom: calc\(5rem \+ var\(--mobile-bar-offset\)\)/ { found=1 }
  closeblk && /^\}/ { closeblk=0 }
  inmob && /^\}/ && !closeblk { inmob=0 }
  END { exit found ? 0 : 1 }
' "$css"; then
  echo "PASS close padding uses mobile-bar-offset"
  pass=$((pass + 1))
else
  echo "FAIL close padding uses mobile-bar-offset"
  failn=$((failn + 1))
fi

if awk '
  /@media \(max-width: 767px\)/ { inmob=1 }
  inmob && /\.status-badge \{/ { badge=1 }
  badge && /clip: rect\(0, 0, 0, 0\)/ { found=1 }
  badge && /^[[:space:]]*\}/ { badge=0 }
  inmob && /^\}/ && !badge { inmob=0 }
  END { exit found ? 0 : 1 }
' "$css"; then
  echo "PASS status-badge visually hidden on mobile (a11y kept)"
  pass=$((pass + 1))
else
  echo "FAIL status-badge visually hidden on mobile (a11y kept)"
  failn=$((failn + 1))
fi

check "wa short label markup" grep -qF -e "topbar__wa-short" -- "$html"
check "min-height 44px" grep -qF -e "min-height: 44px" -- "$css"
check "highlights wrap" grep -qF -e "flex-wrap: wrap" -- "$css"

total=$((pass + failn))
echo "SUMMARY ($pass,$total) FAILED=$failn"
echo "EXIT_CODE=$failn"
if [ "$failn" -eq 0 ]; then exit 0; else exit 1; fi
