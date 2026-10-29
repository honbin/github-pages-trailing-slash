#!/bin/sh
# Print the status and redirect target of each sample URL.
# Usage: ./check.sh [base URL]
base=${1:-https://honbin.github.io/github-pages-trailing-slash}

for layout in flat directory; do
  for path in "" about posts posts/hello; do
    for slash in "" /; do
      if [ -z "$path" ]; then
        [ -z "$slash" ] && continue
        page="/$layout/"
      else
        page="/$layout/$path$slash"
      fi
      printf '%-28s ' "$page"
      curl -s -o /dev/null -w '%{http_code} %{redirect_url}\n' "$base$page"
    done
  done
done
