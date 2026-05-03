#!/usr/bin/env bash
set -euo pipefail

# Remove all .gitkeep files from the project, excluding dot-folders like .git and .godot.
find . -type d -not -path './.*' -exec find {} -maxdepth 1 -type f -name '.gitkeep' -delete \;
