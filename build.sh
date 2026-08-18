#!/bin/bash

OUTPUT=$1
VERSION=$2

mkdir -p "$OUTPUT"

for dir_path in src/*/; do
    [ -d "$dir_path" ] || continue
    echo $dir_path
    name=$(basename "$dir_path")
    file="${dir_path}main.typ"

    if [ ! -f "$file" ]; then
        echo "$file not found."
        exit 1
    fi

    typst compile "$file" "$OUTPUT/${name}.pdf" \
        --ignore-system-fonts \
        --font-path src \
        --pdf-standard a-3b \
        --input revision="$VERSION" \
        --root src
done
