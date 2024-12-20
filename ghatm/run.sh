#!/usr/bin/env bash 

set -euC
set -o pipefail

cd "$(dirname "$0")/.."

org="$1"
reviewer="$2"

export GITHUB_TOKEN="$(gh auth token)"

multi-gitter run ./ghatm/set-timeout.sh \
  --assignees taikinoda \
  --git-type cmd \
  -O "$org" \
  -t "GitHub Actions Workflow にタイムアウトを設定" \
  -b "$(cat ./ghatm/body.md)" \
  -B feature/set-gha-timeout \
  --reviewers "$reviewer" \
  --concurrent 10
