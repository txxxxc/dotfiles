# Returns 0 if fish is interactive - that is, connected to a keyboard.
if status is-interactive
	## エラー出るけどasdf自体は動いているので一旦エラーが出力されないように握りつぶします
	eval (/opt/homebrew/bin/brew shellenv)
	source /opt/homebrew/opt/asdf/libexec/asdf.fish &> /dev/null
end
