DOTFILES="$(pwd)"

ln -sf ${DOTFILES}/.vimrc ${DOTFILES}/.config/nvim/init.vim
ln -snfv ${DOTFILES}/Brewfile ~/

for f in .??*; do
    [ "$f" = ".git" ] && continue
    [ "$f" = ".github" ] && continue
    [ "$f" = ".gitconfig.local.template" ] && continue
    [ "$f" = ".gitmodules" ] && continue

    # シンボリックリンクを貼る
    ln -snfv ${DOTFILES}/"$f" ~/
done



