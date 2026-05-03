#!/usr/bin/env bash
set -euo pipefail

find . -type d -not -path './.*' -exec find {} -maxdepth 1 -type f -name '.gitkeep' -delete \;
