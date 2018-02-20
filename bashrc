export BASE_DIR="$HOME/Documents"
alias dotfiles="cd $BASE_DIR/dotfiles"
CURRENT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
unamestr=`uname`

if [ -f $BASE_DIR/dotfiles/aliases ]; then
  . $BASE_DIR/dotfiles/aliases
fi

if [ -f $HOME/.project_settings ]; then
  . $HOME/.project_settings
fi

if [ -f $HOME/.colors ]; then
  . $HOME/.colors
fi

if [[ "$unamestr" == 'Darwin' ]]; then
  . $BASE_DIR/dotfiles/darwin
else
  . $BASE_DIR/dotfiles/linux
fi

alias reload='. ~/.bashrc'
alias edit_profile='vim ~/.bashrc'
