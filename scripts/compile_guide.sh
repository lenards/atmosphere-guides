#!/bin/bash
if [ -z "$THEME_NAME" ]; then
  THEME_NAME="cyverse"
fi

if [ -z "$1" ]; then
  echo "Error:No section name given."
  echo "Usage: $0 [section_name]"
  exit 1
fi

SECTION=$1
MD_FILES=`find "src/${SECTION}/" -name "*.md" | sort | tr '\n' ' '`
#Calls pandoc
pandoc \
    --template "templates/html/bootstrap.html"\
    -B "themes/$THEME_NAME/templates/header.html"\
    -H "themes/$THEME_NAME/templates/headers.html"\
    -c "./themes/$THEME_NAME/templates/main.css"\
    -A "themes/$THEME_NAME/templates/footer.html"\
    --standalone -S --toc --toc-depth 4\
    -t "html" -o "./dist/${SECTION}.html"\
    $MD_FILES
