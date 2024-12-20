#!/usr/bin/env bash

set -euC
set -o pipefail

cd "$(dirname "$0")/.."

org="$1"
reviewer="$2"

export GITHUB_TOKEN=$(gh auth token)

multi-gitter run ./mise/rename-mise-toml.sh \
  --assignees taikinoda \
	--git-type cmd \
	-O "$org" \
	-t ".mise.tomlをmise.tomlに修正" \
	-b "$(cat body.md)" \
	-B feature/rename-mise-toml \
  --team-reviewers "$org/$reviewer" \
  --concurrent 10
