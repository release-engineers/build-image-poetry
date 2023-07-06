FROM python:3.11-slim

# Based on https://github.com/actions/actions-runner-controller/blob/5ba3805a3f0bb4ed7afb759331de50744e0cd885/runner/actions-runner-dind.ubuntu-22.04.dockerfile

# Use 1001 and 121 for compatibility with GitHub-hosted runners
ARG RUNNER_UID=1000
ARG DOCKER_GID=1001

# Runner user
RUN adduser --disabled-password --gecos "" --uid $RUNNER_UID runner \
    && groupadd docker --gid $DOCKER_GID \
    && usermod -aG sudo runner \
    && usermod -aG docker runner \
    && echo "%sudo   ALL=(ALL:ALL) NOPASSWD:ALL" > /etc/sudoers \
    && echo "Defaults env_keep += \"DEBIAN_FRONTEND\"" >> /etc/sudoers

LABEL org.opencontainers.image.source=https://github.com/release-engineers/build-image-poetry

RUN pip install --no-cache-dir poetry

RUN apt update \
    && apt install -y bash git curl \
    && apt clean

RUN curl -fsSL https://raw.githubusercontent.com/docker/docker-install/c2de0811708b6d9015ed1a2c80f02c9b70c8ce7b/install.sh -o get-docker.sh \
    && sh get-docker.sh \
    && rm get-docker.sh

ENTRYPOINT ["/bin/bash", "-c"]

ENV HOME=/home/runner
