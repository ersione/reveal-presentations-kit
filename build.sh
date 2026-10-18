#!/usr/bin/env bash
set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"
SCSS_DIR="$SCRIPT_DIR/scss/source"
DIST_DIR="$SCRIPT_DIR/dist"

mkdir -p "$DIST_DIR"

echo "Building reveal.js themes..."
npx sass \
  "$SCSS_DIR/ersione-dark.scss:$DIST_DIR/ersione-dark.css" \
  "$SCSS_DIR/ersione-light.scss:$DIST_DIR/ersione-light.css" \
  "$SCSS_DIR/ersione-mint.scss:$DIST_DIR/ersione-mint.css" \
  --no-source-map \
  --style=expanded

echo ""
echo "Built:"
ls -lh "$DIST_DIR"/*.css
echo ""
echo "Copy the CSS you need into your presentation's vendor/theme/ folder."
