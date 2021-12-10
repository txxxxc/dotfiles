autoload -Uz vcs_info
autoload -Uz colors && colors
export LSCOLORS='exfxcxdxbxegedabagacad'
export GREP_COLOR='1;33'
export CLICOLOR=1
zstyle ':completion:*' list-colors ${(s.:.)LSCOLORS}

# PROMPTテーマ
setopt prompt_subst #プロンプト表示する度に変数を展開
local BLACK=$'%{\e[30m%}'
local RED=$'%{\e[31m%}'
local GREEN=$'%{\e[32m%}'
local YELLOW=$'%{\e[33m%}'
local BLUE=$'%{\e[34m%}'
local PURPLE=$'%{\e[35m%}'
local CYAN=$'%{\e[36m%}'
local GRAY=$'%{\e[37m%}'
local WHITE=$'%{\e[1;37m%}'
local DEFAULT=$'%{\e[1;m%}'
local RAINBOW=$'%{\e[$[color=$[31+$RANDOM%6]]m%}'
PROMPT="
${CYAN}%~${reset_color}$ "

zstyle ':vcs_info:git:*' check-for-changes true      # formats 設定項目で %c,%u が使用可
zstyle ':vcs_info:git:*' stagedstr "%F{red}"         # commit されていないファイルがある
zstyle ':vcs_info:git:*' unstagedstr "%F{red}"       # add されていないファイルがある
zstyle ':vcs_info:*' formats "%F{green}%b %c%u%m %f" # 通常
zstyle ':vcs_info:*' actionformats '[%b|%a]'         # rebase 途中,merge コンフリクト等 formats 外の表示
precmd () { vcs_info }
PROMPT="
${CYAN}%~${reset_color}"
PROMPT=$PROMPT'  ${vcs_info_msg_0_}
${GRAY}$ ${reset_color}'

zstyle ':vcs_info:git+set-message:*' hooks git-is_clean git-untracked

# プロンプトの表示設定(好きなようにカスタマイズ可)
setopt PROMPT_SUBST ; PS1='%F{green}%n@%m%f: %F{cyan}%~%f %F{red}$(__git_ps1 "(%s)")%f
\$ '

# 状態がクリーンか判定
function +vi-git-is_clean(){
    if [ -z "$(git status --short 2>/dev/null)" ];then
        hook_com[misc]+="✔"
    fi
}
# unstaged, untrackedの検知
function +vi-git-untracked() {
    if [ -n "$(git status --porcelain 2>/dev/null)" ]; then
        hook_com[unstaged]+='%F{red}✗%f'
    fi
}
