# Default recipe to display help information
default:
    @just --list

# Build PDF
pdf PAPER:
    #!/usr/bin/env bash
    pushd ./papers/{{ PAPER }}
    pdflatex \
        -halt-on-error \
        -output-format=pdf \
        paper.tex
    popd

# Build bibliography
bib PAPER:
    #!/usr/bin/env bash
    pushd ./papers/{{ PAPER }}
    rm -v paper.aux paper.toc
    pdflatex -halt-on-error -draftmode paper.tex
    bibtex paper.aux
    popd

# Prepare all papers
prep:
    #!/usr/bin/env bash
    for PAPER in "papers"/*; do
        if [ -d "$PAPER" ]; then
            just bib $(basename $PAPER)
        fi
    done

# Build all papers
build:
    #!/usr/bin/env bash
    for PAPER in "papers"/*; do
        if [ -d "$PAPER" ]; then
            just pdf $(basename $PAPER)
        fi
    done

# Run workspace with hot-reload
dev:
    mprocs
