export BASE_DIR="$HOME/Documents"
alias dotfiles="cd $BASE_DIR/dotfiles"
CURRENT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

alias ll='ls -lh'
alias la='ls -Alh'

# Git Aliases
alias gst='git status'

if [ -f $HOME/.aliases ]; then
  . $HOME/.aliases
fi

if [ -f $HOME/.project_settings ]; then
  . $HOME/.project_settings
fi

if [ -f $HOME/.colors ]; then
  . $HOME/.colors
fi

# Git & Bash
function parse_git_branch {
  git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/(\1)/'
}

function inhist() {
  cat $HOME/.bash_history | grep $@
}

unamestr=`uname`
if [[ "$unamestr" == 'Darwin' ]]; then
  export JAVA_HOME=`/usr/libexec/java_home -v 1.7.0_79`
  export STUDIO_JDK=$JAVA_HOME

  # Rails Aliases
  function sc() {
    if [ -f ./script/rails ]; then
      rails c $@
    elif [ -f ./bin/rails ]; then
      ./bin/rails console $@
    else
      ./script/console $@
    fi
  }

  function sd() {
    if [ -f ./script/rails ]; then
      rails s --debugger $@
    else
      ./script/server --debugger
    fi
  }

  function s() {
    if [ -f ./script/rails ]; then
      rails s $@
    elif [ -f ./script/server ]; then
      ./script/server $@
    else
      ./bin/rails server $@
    fi
  }

  function ssh_ec2_key() {
    ssh -i $HOME/.ssh/$1.pem deploy@$2;
  }

  function sftp_ec2_key() {
    sftp -o IdentityFile=$HOME/.ssh/$1.pem deploy@$2;
  }

  function safari() {
    open '/Applications/Safari.app';
  }

  function chrome() {
    open '/Applications/Google Chrome.app';
  }

  export LSCOLORS=GxGxcxdxCxegedabagacad
  export CLICOLOR=1

  ulimit -Sn 1024
  export PS1="$CYAN_E\w$YELLOW_E \$(parse_git_branch)$WHITE_E $\[\033[00m\] "

  alias fix_context_menu='/System/Library/Frameworks/CoreServices.framework/Versions/A/Frameworks/LaunchServices.framework/Versions/A/Support/lsregister -kill -r -domain local -domain user;killall Finder;echo "Open With has been rebuilt, Finder will relaunch"'

  # Docker Aliases
  alias d='docker'
  alias di='docker images'
  alias drmi='docker rmi'
  alias ldcp='TAG="latest" docker-compose up'
  alias ldcd='TAG="latest" docker-compose down'

  function removeDockerContainers() {
    docker rm $(docker ps -a -q)
  }

  if [[ -d $BASE_DIR ]]; then
    PATH="$BASE_DIR/bin:$BASE_DIR/sbin:$PATH"; export PATH
  fi

  [[ -s $HOME/.tmuxinator/scripts/tmuxinator ]] && source $HOME/.tmuxinator/scripts/tmuxinator

  export SVN_EDITOR="vim"
  export EDITOR="vim"
  export MYSQL_SOCKET="/tmp/mysql.sock"

  # Android SDK
  # export ANDROID_HOME="$BASE_DIR/android-sdk-macosx"
  export ANDROID_HOME="$HOME/Library/Android/sdk"
  export PATH=$ANDROID_HOME/tools:$ANDROID_HOME/platform-tools:$PATH

  complete -C $BASE_DIR/dotfiles/rake_completion -o default rake
  complete -C $BASE_DIR/dotfiles/capistrano_completion -o default cap

  if [ -f $BASE_DIR/etc/bash_completion ]; then
     . $BASE_DIR/etc/bash_completion
  fi

  ### Added by the Heroku Toolbelt
  export PATH="/usr/local/heroku/bin:$PATH"

  export SSL_CERT_FILE="/Users/oliver/.ssh/cacert.cer"

  export LC_ALL="de_DE.UTF-8"
  export LANG="de_DE.UTF-8"
  export LANGUAGE="de_DE:de"

  # RVM Setup
  [[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*
else
  export PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '
  export LC_ALL="de_DE.UTF-8"
  export LANG="de_DE.UTF-8"
  export LANGUAGE="de_DE:de"
  alias ls='ls --color=auto'
  alias grep='grep --color=auto'
fi

alias reload='. ~/.bashrc'
alias edit_profile='vim ~/.bashrc'

PATH=$PATH:$HOME/.rvm/bin
