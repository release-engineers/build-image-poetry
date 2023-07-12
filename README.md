# release-engineers/build-image-poetry

[![Status: Production ready](https://img.shields.io/badge/status-production_ready-green)](https://release-engineers.com/open-source-badges/)

Docker image for building Python projects with Poetry.

Used by [poetry-template](https://github.com/release-engineers/poetry-template/) projects.

## Usage

In your GitHub Actions workflow, use like so;

```yaml
jobs:
  build:
    runs-on: ubuntu-latest
    container: ghcr.io/release-engineers/build-image-poetry:latest
    steps:
      (...)
```
