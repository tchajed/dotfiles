function gh-latest-run
  gh run watch (gh run list --limit 1 --json databaseId --jq '.[] | .databaseId')
end
