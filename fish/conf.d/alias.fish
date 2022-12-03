alias record-demo='xcrun simctl io booted recordVideo'
alias relog='exec $SHELL -l'
alias .='cd ~/dotfiles'
alias ..='cd ..'
# git
alias ga='git add'
alias gc='git commit'
alias gp='git push'
alias gs='git status'
alias gst='git stash'
alias gsp='git stash pop'
alias gsmain='git switch "$(git symbolic-ref refs/remotes/origin/HEAD | sed s@^refs/remotes/origin/@@)"'
alias gull='git pull origin "$(git symbolic-ref --short HEAD)"'
alias gpo='git push origin "$(git symbolic-ref --short HEAD)"'
alias gph='git push origin "$(git symbolic-ref --short HEAD)"'
alias gush='git push origin "$(git symbolic-ref --short HEAD)"'
alias gsc='git switch -c'
alias gsw='git switch'
alias vim='nvim -u ~/.config/nvim/init.vim'
alias lvim='nvim -u ~/.config/nvim/init.lua'
alias vimcf='vim ~/.config/nvim'
alias dc='docker compose'
alias y='yarn'
alias dot='cd ~/dotfiles'
alias tm='tmux'
alias work='cd ~/workspace'
alias brewic="brew info --cask"
alias job="cd ~/projects/job"
alias me="cd ~/projects/me"
alias c="clear"
alias cl="clear"
alias rmf="rm -rf"
alias r="ruby"
alias heorku="heroku"
alias cat="bat"
alias ls='lsd -A --group-dirs=last'
alias ll='lsd -Ahl --total-size --group-dirs=last'
alias tree='lsd -A --tree --group-dirs=last'
alias lr='lsd -Ahl --total-size --tree --group-dirs=last'
alias du='dust'
alias df='duf'
alias grep='rg -S'

