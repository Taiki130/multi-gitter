#!/usr/bin/env bash
set -euCo pipefail

cd "$(dirname "$0")/.."

org="$1"
reviewer="$2"

git-xargs \
  --branch-name feature/disable-persistent-credentials \
  --commit-message "checkout時にpersistent-credentialsをfalseにする" \
  --github-org "$org" \
  --reviewers "$reviewer" \
  --pull-request-title "checkout時にpersist-credentialsをfalseにする" \
  --pull-request-description "$(cat "$PWD"/persistent-credentials/persistent-credentials/body.md)" \
  --skip-archived-repos \
  "$PWD"/persistent-credentials/persistent-credentials/disable.sh
