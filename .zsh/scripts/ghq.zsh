fgh() {
  declare -r REPO_NAME="$(ghq list >/dev/null | fzf-tmux --reverse +m)"
  [[ -n "${REPO_NAME}" ]] && cd "$(ghq root)/${REPO_NAME}"
}
zle -N fgh
bindkey '^g' fgh
