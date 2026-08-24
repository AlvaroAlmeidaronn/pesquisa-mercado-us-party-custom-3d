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
check "close clearance uses offset" grep -qF -e ".close" -- "$css" && grep -qF -e "var(--mobile-bar-offset)" -- "$css"
check "status-badge hidden mobile" grep -qF -e ".status-badge" -- "$css"
check "wa short label markup" grep -qF -e "topbar__wa-short" -- "$html"
check "min-height 44px" grep -qF -e "min-height: 44px" -- "$css"
check "highlights wrap" grep -qF -e "flex-wrap: wrap" -- "$css"

total=$((pass + failn))
echo "SUMMARY ($pass,$total) FAILED=$failn"
echo "EXIT_CODE=$failn"
if [ "$failn" -eq 0 ]; then exit 0; else exit 1; fi
