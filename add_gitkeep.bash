#!/usr/bin/env bash
find . -type d -not -path './.*' -exec touch {}/.gitkeep \;