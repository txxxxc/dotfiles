  # Returns 0 if fish is interactive - that is, connected to a keyboard.
if status is-interactive
	## エラー出るけどasdf自体は動いているので一旦エラーが出力されないように握りつぶします
	source /opt/homebrew/opt/asdf/libexec/asdf.fish &> /dev/null
	eval (/opt/homebrew/bin/brew shellenv)
end
