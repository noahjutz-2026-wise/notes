#!/bin/bash

OUTPUT=$1
VERSION=$2
TAG=$3

mkdir -p "$OUTPUT"

for dir_path in src/*/; do
    [ -d "$dir_path" ] || continue
    echo $dir_path
    name=$(basename "$dir_path")
    file="${dir_path}main.typ"

    if [ ! -f "$file" ]; then
        echo "$file not found, skipping."
        continue
    fi

    typst compile "$file" "$OUTPUT/${name}.pdf" \
        --ignore-system-fonts \
        --font-path src \
        --pdf-standard a-3b \
        --input GIT_HASH="$VERSION" \
        --input GIT_TAG="$TAG" \
        --root .
done
