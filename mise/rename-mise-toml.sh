#!/usr/bin/env bash

set -euC
set -o pipefail

find . -name '.mise.toml' -exec bash -c 'mv $0 ${0/.mise/mise}' {} \;
