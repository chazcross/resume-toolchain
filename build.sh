#!/bin/sh
# build.sh — compile markdown resumes to PDF via Pandoc + Typst (POSIX sh)
#
# Usage:
#   sh build.sh              # source/resume.md → output/resume.pdf
#   sh build.sh all          # source + all tailored/*.md
#   sh build.sh tailored/2026-03-18-acme-engineer.md

TARGET="${1:-source}"
SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"
TEMPLATE="$SCRIPT_DIR/template/resume.typ"

compile() {
    src="$1"
    name="$(basename "$src" .md)"
    out="output/${name}.pdf"
    printf "Building %s → %s\n" "$src" "$out"
    if pandoc "$src" \
        --pdf-engine=typst \
        --template="$TEMPLATE" \
        -o "$out"; then
        printf "  ✓ %s\n" "$out"
    else
        printf "  ✗ failed: %s\n" "$src"
    fi
}

case "$TARGET" in
    source)
        compile source/resume.md
        ;;
    all)
        compile source/resume.md
        for f in tailored/*.md; do
            [ -f "$f" ] && compile "$f"
        done
        ;;
    *)
        if [ -f "$TARGET" ]; then
            compile "$TARGET"
        else
            printf "error: file not found: %s\n" "$TARGET" >&2
            exit 1
        fi
        ;;
esac
