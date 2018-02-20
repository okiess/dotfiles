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

# Git & Bash
function parse_git_branch {
  git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/(\1)/'
}

function inhist() {
  cat $HOME/.bash_history | grep $@
}

if [[ "$unamestr" == 'Darwin' ]]; then
  export JAVA_HOME=`/usr/libexec/java_home -v 1.8.0_101`
  export STUDIO_JDK=$JAVA_HOME

  # Rails functions
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

  # Google Cloud SDK.
  if [ -f '/Users/oliver/google-cloud-sdk/path.bash.inc' ]; then source '/Users/oliver/google-cloud-sdk/path.bash.inc'; fi
  if [ -f '/Users/oliver/google-cloud-sdk/completion.bash.inc' ]; then source '/Users/oliver/google-cloud-sdk/completion.bash.inc'; fi

  # NVM
  export NVM_DIR="$HOME/.nvm"
  [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
  [ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

  # Rust
  # export PATH="$HOME/.cargo/bin:$PATH"

  # Serverless
  [ -f /Users/oliver/Desktop/crypto-tradelog/node_modules/tabtab/.completions/serverless.bash ] && . /Users/oliver/Desktop/crypto-tradelog/node_modules/tabtab/.completions/serverless.bash
  [ -f /Users/oliver/Desktop/crypto-tradelog/node_modules/tabtab/.completions/sls.bash ] && . /Users/oliver/Desktop/crypto-tradelog/node_modules/tabtab/.completions/sls.bash

  # Add RVM to PATH for scripting. Make sure this is the last PATH variable change.
  export PATH="$PATH:$HOME/.rvm/bin"
  [[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*
else
  export PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '
  export LC_ALL="de_DE.UTF-8"
  export LANG="de_DE.UTF-8"
  export LANGUAGE="de_DE:de"
fi
