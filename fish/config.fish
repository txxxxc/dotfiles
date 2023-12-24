# Returns 0 if fish is interactive - that is, connected to a keyboard.
if status is-interactive
  ## エラー出るけどasdf自体は動いているので一旦エラーが出力されないように握りつぶします
  eval (/opt/homebrew/bin/brew shellenv)
  source /opt/homebrew/opt/asdf/libexec/asdf.fish &> /dev/null
end
set -gx XDG_CONFIG_HOME ~/.config
set -gx EDITOR nvim
fish_add_path $HOME/bin
fish_add_path /opt/homebrew/bin

# /Users/tomoya_tanaka/.asdf/installs/golang/1.21.0
# golang
set -x GOPATH (asdf where golang)
set -x GOROOT (asdf where golang)/go
set -x GOBIN (asdf where golang)/packages/bin
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

set -g fish_key_bindings fish_hybrid_key_bindings
set fish_cursor_default block
set fish_cursor_insert line
set fish_cursor_replace_one underscore
set fish_cursor_visual block
bind -M insert \cg fgh
bind -M insert \co forward-char

zoxide init fish | source

## abbr
abbr -a -- L '--position anywhere --set-cursor ! ! | less' # imported from a universal variable, see `help abbr`
abbr -a -- atf 'atcoder first' # imported from a universal variable, see `help abbr`
abbr -a -- dc docker-compose # imported from a universal variable, see `help abbr`
abbr -a -- gi 'gh issue list' # imported from a universal variable, see `help abbr`
abbr -a -- sb storybook # imported from a universal variable, see `help abbr`
abbr -a -- pnpm 'corepack pnpm' # imported from a universal variable, see `help abbr`
abbr -a -- foo '--set-cursor bar % baz' # imported from a universal variable, see `help abbr`
abbr -a -- ghv 'gh repo view --web' # imported from a universal variable, see `help abbr`
abbr -a -- at atcoder # imported from a universal variable, see `help abbr`
abbr -a -- gov 'gh repo view --web' # imported from a universal variable, see `help abbr`
abbr -a -- mk mkdir # imported from a universal variable, see `help abbr`
abbr -a -- gp 'gh pr list' # imported from a universal variable, see `help abbr`
abbr -a -- npm 'corepack npm' # imported from a universal variable, see `help abbr`
abbr -a -- il 'gh issue list' # imported from a universal variable, see `help abbr`
abbr -a -- pn 'corepack pnpm' # imported from a universal variable, see `help abbr`
abbr -a -- npx 'corepack npx' # imported from a universal variable, see `help abbr`
abbr -a -- pnpx 'corepack pnpx' # imported from a universal variable, see `help abbr`
abbr -a -- yarn 'corepack yarn' # imported from a universal variable, see `help abbr`
abbr -a -- y 'corepack yarn' # imported from a universal variable, see `help abbr`
abbr -a gic --set-cursor "gh issue create --title \"%\" --body \"\"" # imported from a universal variable, see `help abbr`
abbr -a m "make" # imported from a universal variable, see `help abbr`
abbr -a gil "gh issue list" # imported from a universal variable, see `help abbr`
abbr -a svim 'set -gx NVIM_APPNAME sub-nvim && nvim'
abbr -a mvim 'set -gx NVIM_APPNAME nvim && nvim'
abbr -a cvim --set-cursor 'set -gx NVIM_APPNAME % && nvim'

