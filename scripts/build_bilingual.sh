#!/usr/bin/env bash
set -euo pipefail
root="$(pwd)"
english_source="$(mktemp -d)"
trap 'rm -rf "$english_source"' EXIT

# Build both languages from the same theme, bibliography, and shared assets.
rsync -a --exclude='.git' --exclude='_site' --exclude='_i18n' \
  --exclude='vendor' --exclude='.bundle' --exclude='.jekyll-cache' \
  --exclude='node_modules' ./ "$english_source/"
rsync -a _i18n/en/_pages/ "$english_source/_pages/"
rsync -a _i18n/en/_data/ "$english_source/_data/"
bundle exec jekyll build --config "$root/_config.yml,/tmp/pages-url.yml"
bundle exec jekyll build --source "$english_source" --destination "$root/_site/en" \
  --config "$root/_config.yml,/tmp/pages-url.yml,$root/_i18n/en/config.yml"
bundle exec ruby scripts/check_bilingual.rb _site
touch _site/.nojekyll
