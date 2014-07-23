export BASE_DIR="$HOME/Developer"
alias dotfiles="cd $BASE_DIR/dotfiles"
CURRENT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

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

function inhist() {
  cat $HOME/.bash_history | grep $@
}

function ssh_ec2() {
  ssh -i $HOME/.ssh/apphoshies.pem deploy@$@;
}

function ssh_ec2_key() {
  ssh -i $HOME/.ssh/$1.pem deploy@$2;
}

function sftp_ec2() {
  sftp -o IdentityFile=$HOME/.ssh/apphoshies.pem deploy@$@;
}

function sftp_ec2_key() {
  sftp -o IdentityFile=$HOME/.ssh/$1.pem deploy@$2;
}

function docker-enter() {
  boot2docker ssh -t "[ -f /var/lib/boot2docker/nsenter ] || docker run --rm -v /var/lib/boot2docker/:/target jpetazzo/nsenter; sudo /var/lib/boot2docker/docker-enter $@";
}

function docker-killall() { 
  docker stop $(docker ps -a -q)
  docker rm $(docker ps -a -q)
}

# Git Aliases
alias gst='git status'
alias gr='git svn rebase'
alias gdc='git svn dcommit'
alias gpso='git push origin master'
alias gplo='git pull origin master'
alias gpob='git push origin master && git push backup master'

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

unamestr=`uname`
if [[ "$unamestr" == 'Darwin' ]]; then
  export JAVA_HOME="/System/Library/Frameworks/JavaVM.framework/Versions/1.6/Home"
  export ANT_HOME="$BASE_DIR/ant"

  function safari() {
    open '/Applications/Safari.app';
  }

  function chrome() {
    open '/Applications/Google Chrome.app';
  }

  export LSCOLORS=GxGxcxdxCxegedabagacad
  export CLICOLOR=1
  alias ls='ls -G'
  alias ll='ls -lhG'
  alias la='ls -lahG'

  ulimit -Sn 1024
  export PS1="$CYAN_E\w$YELLOW_E \$(parse_git_branch)$WHITE_E $\[\033[00m\] "
  
  alias fix_context_menu='/System/Library/Frameworks/CoreServices.framework/Versions/A/Frameworks/LaunchServices.framework/Versions/A/Support/lsregister -kill -r -domain local -domain user;killall Finder;echo "Open With has been rebuilt, Finder will relaunch"'

  if [[ -d $BASE_DIR ]]; then
    PATH="$BASE_DIR/bin:$BASE_DIR/sbin:$PATH"; export PATH
  fi

  [[ -s $HOME/.tmuxinator/scripts/tmuxinator ]] && source $HOME/.tmuxinator/scripts/tmuxinator

  export SVN_EDITOR="vim"
  export EDITOR="vim"
  export MYSQL_SOCKET="/tmp/mysql.sock"

  # Android SDK
  export ANDROID_HOME="$BASE_DIR/android-sdk-macosx"
  export PATH=$ANDROID_HOME/tools:$ANDROID_HOME/platform-tools:$PATH

  # Google Cloud SDK
  source $BASE_DIR/google-cloud-sdk/path.bash.inc
  source $BASE_DIR/google-cloud-sdk/completion.bash.inc

  # Go
  export GOPATH=$HOME/workspace/go
  export PATH=$GOPATH/bin:$PATH

  complete -C $BASE_DIR/dotfiles/rake_completion -o default rake
  complete -C $BASE_DIR/dotfiles/capistrano_completion -o default cap

  if [ -f $BASE_DIR/etc/bash_completion ]; then
     . $BASE_DIR/etc/bash_completion
  fi

  ### Added by the Heroku Toolbelt
  export PATH="/usr/local/heroku/bin:$PATH"

  # Ansible
  export ANSIBLE_HOSTS="$BASE_DIR/ansible_hosts"
  
  # boot2docker
  export DOCKER_HOST="tcp://192.168.59.103:2375"

  # RVM Setup
  [[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*
else
  export PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '
  alias ls='ls --color=auto'
  alias grep='grep --color=auto'
  alias ll='ls -lh'
  alias la='ls -Alh'
  alias l='ls -CF'
  #export LC_ALL="de_DE.UTF-8"
  #export LANG="de_DE.UTF-8"
  #export LANGUAGE="de_DE:de"
  
  function docker-enter() {
     PID=$(docker inspect --format {{.State.Pid}} $1)
     nsenter --target $PID --mount --uts --ipc --net --pid
  }
fi

alias reload='. ~/.bashrc'
alias edit_profile='vim ~/.bashrc'

PATH=$PATH:$HOME/.rvm/bin
