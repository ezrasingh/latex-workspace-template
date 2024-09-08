# Default recipe to display help information
default:
  @just --list

# Build PDF
pdf PAPER:
    #!/usr/bin/env bash
    pushd ./papers/{{ PAPER }}
    pdflatex \
        -halt-on-error \
        -draftmode \
        paper.tex
    bibtex paper.aux
    pdflatex \
        -halt-on-error \
        -output-format=pdf \
        paper.tex
    popd
  
# Build all papers
build:
    #!/usr/bin/env bash
    for PAPER in "papers"/*; do
        if [ -d "$PAPER" ]; then
            just pdf $(basename $PAPER)
        fi
    done
