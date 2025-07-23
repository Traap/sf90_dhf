#!/usr/bin/env bash
set -euo pipefail

# Variables
TITLE="Sample Document"
INPUT="main.md"
OUTPUT_DIR="output"
DATE=$(date +%Y-%m-%d)
HTML_OUTPUT="$OUTPUT_DIR/document.html"
PDF_OUTPUT="$OUTPUT_DIR/document.pdf"

# Create output directory if missing
mkdir -p "$OUTPUT_DIR"

# Pandoc options
PANDOC_OPTS=(
  --from markdown
  --to html5
  --standalone
  --metadata title="$TITLE"
  --include-before-body includes/header.md
  --include-after-body includes/footer.md
  --toc
  --highlight-style tango
)

echo "Building HTML..."
pandoc "${PANDOC_OPTS[@]}" "$INPUT" -o "$HTML_OUTPUT"

echo "Building PDF..."
pandoc "${PANDOC_OPTS[@]}" "$INPUT" -o "$PDF_OUTPUT"

echo "✅ Done. Output in: $OUTPUT_DIR"
