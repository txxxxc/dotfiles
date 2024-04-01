function gh-search-pr-review-requested -d 'Search PRs where you are requested to review'
  gh pr list --search "review-requested:@me" | fzf | awk '{print $1}' | xargs gh pr view --web
end

