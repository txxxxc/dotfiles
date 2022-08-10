DOTFILES="$(pwd)"
SETUP_SCRIPTS="${DOTFILES}/setup-scripts"
COLOR_GRAY="\033[1;38;5;243m"
COLOR_BLUE="\033[1;34m"
COLOR_GREEN="\033[1;32m"
COLOR_RED="\033[1;31m"
COLOR_PURPLE="\033[1;35m"
COLOR_YELLOW="\033[1;33m"
COLOR_NONE="\033[0m"

title() {
    echo -e "\n${COLOR_PURPLE}$1${COLOR_NONE}"
    echo -e "${COLOR_GRAY}==============================${COLOR_NONE}\n"
}

title "Setup symlink"
source ${SETUP_SCRIPTS}/setup-symlink.sh

title "Setup macOS"
source ${SETUP_SCRIPTS}/setup-macos.sh

title "Setup Homebrew"
source ${SETUP_SCRIPTS}/setup-homebrew.sh

anyenv init

exec $SHELL -l
