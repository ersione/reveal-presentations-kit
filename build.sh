#!/usr/bin/env bash
set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"
SCSS_DIR="$SCRIPT_DIR/scss/source"
DIST_DIR="$SCRIPT_DIR/dist"

mkdir -p "$DIST_DIR"

echo "Building reveal.js themes..."
npx sass \
  "$SCSS_DIR/obsidian-wave.scss:$DIST_DIR/obsidian-wave.css" \
  "$SCSS_DIR/atlas-blue.scss:$DIST_DIR/atlas-blue.css" \
  "$SCSS_DIR/mint-pop.scss:$DIST_DIR/mint-pop.css" \
  --no-source-map \
  --style=expanded

echo ""
echo "Built:"
ls -lh "$DIST_DIR"/*.css
echo ""
echo "Copy the CSS you need into your presentation's vendor/theme/ folder."
