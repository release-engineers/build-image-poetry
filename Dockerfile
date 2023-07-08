FROM python:3.11-slim

LABEL org.opencontainers.image.source=https://github.com/release-engineers/build-image-poetry

# Install poetry
RUN pip install --no-cache-dir poetry

# Install bash, git, curl
RUN apt update \
    && apt install -y bash git curl \
    && apt clean

# Install docker, client only
COPY --from=docker:dind /usr/local/bin/docker /usr/local/bin/

ENTRYPOINT ["/bin/bash", "-c"]
