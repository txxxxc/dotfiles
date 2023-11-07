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

# golang
set -x GOPATH (go env GOPATH)
set -x GOROOT (go env GOROOT)
set -x GOBIN (go env GOPATH)/bin
fish_add_path $GOPATH/bin
fish_add_path $GOROOT/bin
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

bind -M insert \cg fgh
bind -M insert \cn down-or-search
bind -M insert \cp up-or-search

