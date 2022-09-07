hub_open() {
	hub browse $(ghq list | fzf | cut -d "/" -f 2,3)
}
zle -N hub_open
bindkey '^h' hub_open

gh_open_current_project() {
	# echoで改行してます
	yes "" | gh browse
}
zle -N gh_open_current_project
bindkey '^b' gh_open_current_project
