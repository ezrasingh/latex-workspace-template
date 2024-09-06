# Default recipe to display help information
default:
  @just --list

# Compile latex document
build:
    latex paper.tex

# Build document PDF
pdf:
    latex -output-format=pdf paper.tex