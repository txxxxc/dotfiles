
/bin/zsh -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

for f in .??*; do
    [ "$f" = ".git" ] && continue
    [ "$f" = ".gitconfig.local.template" ] && continue
    [ "$f" = ".gitmodules" ] && continue

    # シンボリックリンクを貼る
    ln -snfv ${PWD}/"$f" ~/
done

ln -snfv ${PWD}/Brewfile ~/

mkdir -p ~/.vim
ln -sf ${PWD}/dein.toml ~/.vim/
ln -sf ${PWD}/settings ~/.vim/

mkdir -p ~/config/nvim
ln -sf ${PWD}/.vimrc ~/config/nvim/init.vim
ln -sf ${PWD}/settings ~/config/nvim/
ln -sf ${PWD}/coc-settings.json ~/config/nvim/

brew bundle
$(brew --prefix)/opt/fzf/install

anyenv install rbenv
anyenv install pyenv
anyenv install nodenv
anyenv install goenv

exec $SHELL -l


