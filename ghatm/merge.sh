#!/usr/bin/env bash 

set -euC
set -o pipefail

cd "$(dirname "$0")/.."

org="$1"

export GITHUB_TOKEN=$(gh auth token)

multi-gitter merge \
	-O "$org" \
	-B feature/set-gha-timeout \
	--skip-forks
