#!/usr/bin/env fish
# build.fish — compile markdown resumes to PDF via Pandoc + Typst
#
# Usage:
#   fish build.fish              # source/resume.md → output/resume.pdf
#   fish build.fish all          # source + all tailored/*.md
#   fish build.fish tailored/2026-03-18-acme-engineer.md

set -l target (or $argv[1] "source")
set -l template (status dirname)/template/resume.typ

function compile
    set -l src $argv[1]
    set -l name (basename $src .md)
    set -l out output/$name.pdf
    echo "Building $src → $out"
    pandoc $src \
        --pdf-engine=typst \
        --template=$template \
        -o $out
    and echo "  ✓ $out"
    or echo "  ✗ failed: $src"
end

switch $target
    case source
        compile source/resume.md

    case all
        compile source/resume.md
        for f in tailored/*.md
            test -f $f; and compile $f
        end

    case '*'
        if test -f $target
            compile $target
        else
            echo "error: file not found: $target"
            exit 1
        end
end
