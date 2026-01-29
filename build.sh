#!/usr/bin/env bash
# Build Session Alive extension for local install in Chrome.
# Output: dist/session-alive/ (load as unpacked) and dist/session-alive.zip

set -e
cd "$(dirname "$0")"

DIST=dist
OUT="$DIST/session-alive"
ZIP="$DIST/session-alive.zip"

rm -rf "$OUT" "$ZIP"
mkdir -p "$OUT"

# Copy extension files (exclude dev-only)
rsync -a \
  --exclude='.git' \
  --exclude='.gitignore' \
  --exclude='readme-resources' \
  --exclude='session-alive.zip' \
  --exclude='dist' \
  --exclude='node_modules' \
  --exclude='build.sh' \
  . "$OUT/"

# Create zip for portability
(cd "$DIST" && zip -r session-alive.zip session-alive)

echo "Build complete:"
echo "  Unpacked: $OUT"
echo "  Zip:      $ZIP"
echo ""
echo "To test in Chrome:"
echo "  1. Open chrome://extensions"
echo "  2. Enable 'Developer mode'"
echo "  3. Click 'Load unpacked' and select: $(pwd)/$OUT"
