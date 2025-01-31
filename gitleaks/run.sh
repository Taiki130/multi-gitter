#!/usr/bin/env bash
set -euCo pipefail

cd "$(dirname "$0")/.."

org="$1"
reviewer="$2"

export GITHUB_TOKEN="$(gh auth token)"

multi-gitter run ./gitleaks/upgrade.sh \
  --assignees Taiki130 \
  --git-type cmd \
  -O "$org" \
  -t "gitleaks actionのversionを最新まで上げる" \
  -b "$(cat gitleaks/body.md)" \
  -B feature/upgrade-gitleaks-action \
  --reviewers "$reviewer" \
  --concurrent 10
