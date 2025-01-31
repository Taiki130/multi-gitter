#!/usr/bin/env bash
set -euC
set -o pipefail

export PINACT_CONFIG="/Users/taiki.noda/Private/multi-gitter/gitleaks/pinact.yaml"
pinact run -u
