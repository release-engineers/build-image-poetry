FROM python:3.11-slim

LABEL org.opencontainers.image.source=https://github.com/release-engineers/build-image-poetry

RUN pip install --no-cache-dir poetry

RUN apt update \
    && apt install -y bash git \
    && apt clean

ENTRYPOINT ["/bin/bash", "-c"]
