# Notes

![Typst v0.15.1](https://img.shields.io/badge/Typst-v0.15.1-239dad?logo=typst)
![PDF/A-3b](https://img.shields.io/badge/PDF-A--3b-007ec6)

## Development

```sh
tinymist preview --ignore-system-fonts --font-path src --pdf-standard a-3b --root . --input revision=$(git rev-parse --short HEAD) src/02_kernpunkte/main.typ
```

## Compiling

```sh
typst c --ignore-system-fonts --font-path src --pdf-standard a-3b --root . --input revision=$(git rev-parse --short HEAD) src/03_literaturrecherche/main.typ
```

## Structure

```
.
└── src
    ├── 01_document
    │   ├── assets
    │   │   └── git_lfs_stored.png
    │   └── main.typ
    ├── deps.typ
    └── template.typ
```
