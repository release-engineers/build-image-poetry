FROM python:3.11-slim

LABEL org.opencontainers.image.source=https://github.com/release-engineers/build-image-poetry

RUN pip install --no-cache-dir poetry

RUN apt update \
    && apt install -y bash git curl \
    && apt clean

RUN curl -fsSL https://raw.githubusercontent.com/docker/docker-install/c2de0811708b6d9015ed1a2c80f02c9b70c8ce7b/install.sh -o get-docker.sh \
    && sh get-docker.sh \
    && rm get-docker.sh

ENTRYPOINT ["/bin/bash", "-c"]
