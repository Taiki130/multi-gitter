#!/usr/bin/env bash
set -euCo pipefail

cd "$(dirname "$0")/.."

org="$1"
reviewer="$2"

export GITHUB_TOKEN=$(gh auth token)

multi-gitter run ./persistent-credentials/disable.sh \
  --assignees taikinoda \
  --git-type cmd \
  -O "$org" \
  -t "checkout時にpersistent-credentialsをfalseにする" \
  -b "$(cat persistent-credentials/body.md)" \
  -B feature/disable-persistent-credentials \
  --reviewers "$reviewer" \
  --concurrent 10
