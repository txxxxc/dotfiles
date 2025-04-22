# Returns 0 if fish is interactive - that is, connected to a keyboard.
fish_add_path "$ASDF_DIR/bin"
fish_add_path "$HOME/.asdf/shims"
fish_add_path "/usr/local/bin"

# if status is-interactive
#   ## エラー出るけどasdf自体は動いているので一旦エラーが出力されないように握りつぶします
#   eval (/opt/homebrew/bin/brew shellenv)
#   source /opt/homebrew/opt/asdf/libexec/asdf.fish &> /dev/null
# end

set -gx XDG_CONFIG_HOME ~/.config
set -gx EDITOR nvim
# fish_add_path $HOME/bin
fish_add_path /opt/homebrew/bin

# /Users/tomoya_tanaka/.asdf/installs/golang/1.21.0
# golang
set -gx GHQ_ROOT $HOME/projects
fish_add_path $GOPATH/go/bin
fish_add_path $GOBIN

# mint
set -gx MINT_PATH $HOME/.mint
set -gx MINT_LINK_PATH $MINT_PATH/bin
fish_add_path MINT_PATH

# pnpm
set -gx PNPM_HOME "/Users/tomoya_tanaka/Library/pnpm"
if not string match -q -- $PNPM_HOME $PATH
  set -gx PATH "$PNPM_HOME" $PATH
end
# pnpm end

set -gx fish_key_bindings fish_hybrid_key_bindings
set -gx fish_cursor_default block
set -gx fish_cursor_insert line
set -gx fish_cursor_replace_one underscore
set -gx fish_cursor_visual block
set -g fish_vi_force_cursor 1
bind -M insert \cg fgh
bind -M insert \co forward-char

zoxide init fish | source

## abbr
abbr -a -- L '--position anywhere --set-cursor ! ! | less' # imported from a universal variable, see `help abbr`
abbr -a -- atf 'atcoder first' # imported from a universal variable, see `help abbr`
abbr -a -- dc 'docker compose' # imported from a universal variable, see `help abbr`
abbr -a -- sb storybook # imported from a universal variable, see `help abbr`
abbr -a -- foo '--set-cursor bar % baz' # imported from a universal variable, see `help abbr`
abbr -a -- ghv 'gh repo view --web' # imported from a universal variable, see `help abbr`
abbr -a -- at atcoder # imported from a universal variable, see `help abbr`
abbr -a -- gov 'gh repo view --web' # imported from a universal variable, see `help abbr`
abbr -a -- mk mkdir # imported from a universal variable, see `help abbr`
abbr -a -- gp 'gh pr list' # imported from a universal variable, see `help abbr`
abbr -a -- il 'gh issue list' # imported from a universal variable, see `help abbr`
abbr -a gic --set-cursor "gh issue create --title \"%\" --body \"\"" # imported from a universal variable, see `help abbr`
abbr -a m "make" # imported from a universal variable, see `help abbr`
abbr -a gil "gh issue list" # imported from a universal variable, see `help abbr`
abbr -a vim 'set -gx NVIM_APPNAME nvim && nvim'
abbr -a cvim --set-cursor 'set -gx NVIM_APPNAME % && nvim'
abbr -a rmf "rm -rf" # imported from a universal variable, see `help abbr`
abbr -a lg "lazygit" # imported from a universal variable, see `help abbr`
# abbr -a cat "bat --theme=Nord" # imported from a universal variable, see `help abbr`
abbr -a stime "/usr/bin/time -p" # imported from a universal variable, see `help abbr
abbr -a gsw "git switch"
abbr -a gst "git stash"
abbr -a lsa "ls -la" # imported from a universal variable, see `help abbr
abbr -a giv "gh issue list | fzf | awk '{print \$1}' | xargs gh issue view --web"
abbr -a gpv "gh pr list | fzf | awk '{print \$1}' | xargs gh pr view --web"
abbr -a ld "lazydocker"
abbr -a cs "cursor"
abbr -a gull "git pull origin \$(git symbolic-ref --short HEAD)"


# gh-search-pr-review-requestedのabbr
abbr -a -- grr 'gh-search-pr-review-requested' # imported from a universal variable, see `help abbr`
set -x PATH (pwd)"/git-fuzzy/bin:$PATH"
set -x FZF_DEFAULT_OPTS "$FZF_DEFAULT_OPTS
      --color=fg:#e5e9f0,bg:#3b4252,hl:#81a1c1
      --color=fg+:#e5e9f0,bg+:#3b4252,hl+:#81a1c1
      --color=info:#eacb8a,prompt:#bf6069,pointer:#b48dac
      --color=marker:#a3be8b,spinner:#b48dac,header:#a3be8b"

# git

set __fish_git_prompt_showdirtystate 'yes'
set __fish_git_prompt_showstashstate 'yes'
set __fish_git_prompt_showupstream 'yes'

