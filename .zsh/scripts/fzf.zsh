function fzf-cdr () {
    local selected_dir="$(cdr -l | sed 's/^[0-9]* //' | fzf --prompt="cdr >" --query "$LBUFFER")"

    if [ -n "$selected_dir" ]; then
				echo $selected_dir
        BUFFER="cd ${selected_dir}"
        zle accept-line
    fi
}
zle -N fzf-cdr
bindkey '^E' fzf-cdr

function fzf-vim () {
  local file
	file=$(find ${1:-.} -type f ! -path "./.git/*" ! -path "./node_modules/*" 2> /dev/null | fzf +m) && vim "$file"
}
zle -N fzf-vim
bindkey '^O' fzf-vim
