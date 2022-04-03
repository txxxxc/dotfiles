DOTFILES="$(pwd)"

for f in .??*; do
    [ "$f" = ".git" ] && continue
    [ "$f" = ".gitconfig.local.template" ] && continue
    [ "$f" = ".gitmodules" ] && continue

    # シンボリックリンクを貼る
    ln -snfv ${DOTFILES}/"$f" ~/
done

ln -sf ${DOTFILES}/.vimrc ~/.config/nvim/init.vim
ln -snfv ${DOTFILES}/Brewfile ~/


