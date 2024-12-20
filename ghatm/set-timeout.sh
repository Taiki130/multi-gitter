#!/usr/bin/env bash

set -euC
set -o pipefail

ghatm set -auto -repo "$(gh repo view --json nameWithOwner -q '.nameWithOwner')"
