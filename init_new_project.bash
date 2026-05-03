#!/usr/bin/env bash
set -euo pipefail

script_dir="$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" && pwd)"
cd "$script_dir"

if [[ -d .git ]]; then
	rm -rf .git
fi

init_git=""
while [[ "$init_git" != "y" && "$init_git" != "n" ]]; do
	read -r -p "Initialize git and push to a new origin? (y/n): " init_git
	init_git="${init_git,,}"
done

if [[ "$init_git" == "y" ]]; then
	origin_url=""
	while [[ -z "$origin_url" ]]; do
		read -r -p "Enter the new origin URL (https:// or git@): " origin_url
		if [[ ! "$origin_url" =~ ^https?:// && ! "$origin_url" =~ ^git@ ]]; then
			echo "Invalid URL. Use https:// or git@..."
			origin_url=""
		fi
	done

	git init
	git add .
	git commit -m "Initial commit"
	git branch -M main
	git remote add origin "$origin_url"
	git push -u origin main
fi

find . -type d -not -path './.*' -exec find {} -maxdepth 1 -type f -name '.gitkeep' -delete \;

rm -f "$script_dir/add_gitkeep.bash" "$script_dir/init_new_project.bash"

