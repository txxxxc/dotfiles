incremental_search_history() {
  selected=`history -E 1 | fzf | cut -b 26-`
  BUFFER=`[ ${#selected} -gt 0 ] && echo $selected || echo $BUFFER`
  CURSOR=${#BUFFER}
  zle redisplay
}
zle -N incremental_search_history
