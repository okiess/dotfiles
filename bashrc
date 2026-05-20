export BASE_DIR="$HOME/Documents"
alias dotfiles="cd $BASE_DIR/dotfiles"
CURRENT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

. $BASE_DIR/dotfiles/init

alias reload='. ~/.bashrc'
alias edit_profile='vim ~/.bashrc'
