hub_open() {
	hub browse $(ghq list | fzf | cut -d "/" -f 2,3)
}
zle -N hub_open
bindkey '^h' hub_open

hub_open_current_project() {
	hub browse
}
zle -N hub_open_current_project
bindkey '^b' hub_open_current_project
