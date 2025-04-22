alias record-demo='xcrun simctl io booted recordVideo'
alias relog='exec $SHELL -l'
alias .='cd ~/dotfiles'
alias ..='cd ..'

# git
alias ga='git add'
alias gc='git commit'
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
alias ls='lsd -A --group-dirs=last'
alias ll='lsd -Ahl --total-size --group-dirs=last'
alias tree='lsd -A --tree --group-dirs=last'
alias lr='lsd -Ahl --total-size --tree --group-dirs=last'
alias du='dust'
alias df='duf'
alias grep='rg -S'
alias exe='g++ -Wall -Wextra -pedantic -std=c++14 -O2 -Wshadow -Wformat=2 -Wfloat-equal -Wconversion -Wshift-overflow -Wcast-qual -Wcast-align -D_GLIBCXX_DEBUG -D_GLIBCXX_DEBUG_PEDANTIC -fno-sanitize-recover -fstack-protector'

# neovim
alias vim='nvim -u ~/.config/nvim/init.vim'
alias lvim='nvim -u ~/.config/nvim/_init.lua'
alias vimcf='vim ~/.config/nvim'
alias svim='set -gx NVIM_APPNAME sub-nvim && nvim'
alias mvim='set -gx NVIM_APPNAME nvim && nvim'
alias v='set -gx NVIM_APPNAME nvim && nvim'
