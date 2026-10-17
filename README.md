# Thesis Notes

![Typst v0.15.1](https://img.shields.io/badge/Typst-v0.15.1-239dad?logo=typst)
![PDF/A-3b](https://img.shields.io/badge/PDF-A--3b-007ec6)

Monorepo of various documents related to my bachelor's thesis.

## Development

```bash
tinymist preview \
    --ignore-system-fonts \
    --font-path src \
    --pdf-standard a-3b \
    --root . \
    --input GIT_HASH="$(git rev-parse --short HEAD)" \
    --input GIT_TAG="$(git describe --tags --exact-match)" \
    src/00_organization/main.typ
```

## Compiling

```bash
typst compile \
    --ignore-system-fonts \
    --font-path src \
    --pdf-standard a-3b \
    --root . \
    --input GIT_HASH="$(git rev-parse --short HEAD)" \
    --input GIT_TAG="$(git describe --tags --exact-match)" \
    src/00_organization/main.typ
```

With podman:

```bash
podman build -t thesis-notes .
podman run --userns=keep-id -v ./build:/output thesis-notes
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
