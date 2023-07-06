#!/usr/bin/env bash
#
# Run ./app.sh for usage information.
#

set -e
set -o pipefail

function debug() {
  trap 'printf -- "-- \033[0;36m${BASH_COMMAND}\033[0m\n"' DEBUG
}

command=$1

if [[ $command == "publish-ghcr" ]]; then
  debug
  echo $GITHUB_PACKAGES_TOKEN | docker login ghcr.io --username release-engineers --password-stdin
  image_tag="ghcr.io/release-engineers/build-image-poetry:latest"
  docker build --tag "${image_tag}" .
  docker push "${image_tag}"
  exit 0
fi

if [[ -z $command ]]; then
  echo "Unknown command: ${command}"
fi

echo "Usage: $0 <command>"
echo "Commands:"
echo "  publish-ghcr     -- build and publish the Docker image to the GitHub container registry"

exit 1
