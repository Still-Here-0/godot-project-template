#!/usr/bin/env bash
set -euo pipefail

script_dir="$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" && pwd)"
cd "$script_dir"

find . -type d -not -path './.*' -exec find {} -maxdepth 1 -type f -name '.gitkeep' -delete \;

if [[ -d .git ]]; then
	rm -rf .git
fi

git init
