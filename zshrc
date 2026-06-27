# oh-my-zsh configuration

export ZSH=~/.oh-my-zsh
ZSH_THEME="robbyrussell"

unamestr=`uname`
archstr=`arch`

if [[ "$unamestr" == 'Darwin' ]]; then
  plugins=(
    git
    docker
    tmux
    tmuxinator
    npm
    zsh-autosuggestions
    zsh-syntax-highlighting
    fast-syntax-highlighting
    # zsh-autocomplete
  )
else
  plugins=(
    git
    docker
    tmux
    npm
  )
fi

source $ZSH/oh-my-zsh.sh

# User configuration

alias zshconfig="vim ~/.zshrc"
alias ohmyzsh="vim ~/.oh-my-zsh"

export BASE_DIR="$HOME/Documents"
alias dotfiles="cd $BASE_DIR/dotfiles"
CURRENT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

. $BASE_DIR/dotfiles/init

alias reload='source $HOME/.zshrc'
alias edit_profile='vim $HOME/.zshrc'
