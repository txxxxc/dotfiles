echo 'installing font'
cd /Library/Fonts && { curl -O -s 'https://github.com/ryanoasis/nerd-fonts/raw/master/patched-fonts/Hack/Regular/complete/Hack%20Regular%20Nerd%20Font%20Complete%20Mono.ttf' ; cd -; }

echo 'configure terminal appearance'
open "~/dotfiles/solarized-dark.terminal"
sleep 1
defaults write com.apple.terminal "Default Window Settings" -string "solarized-dark"
defaults write com.apple.terminal "Startup Window Settings" -string "solarized-dark"

