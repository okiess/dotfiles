export BASE_DIR="/Users/oliver/Developer"
export JAVA_HOME="/System/Library/Frameworks/JavaVM.framework/Versions/1.6/Home"
export ANT_HOME="$BASE_DIR/ant"
alias dotfiles="cd $BASE_DIR/dotfiles"

export LSCOLORS=GxGxcxdxCxegedabagacad
export CLICOLOR=1
alias ls='ls -G'
alias ll='ls -lhG'
alias la='ls -lahG'

# Rails Aliases
function sc() {
  if [ -f ./script/rails ]; then 
    rails c $@
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
  else
    ./script/server $@
  fi
}

function safari() {
  open '/Applications/Safari.app';
}

function inhist() {
  cat $HOME/.bash_history | grep $@
}

function ssh_ec2() {
  ssh -i $HOME/.ssh/apphoshies.pem deploy@$@;
}

# Git Aliases
alias gst='git status'
alias gr='git svn rebase'
alias gdc='git svn dcommit'
alias gpso='git push origin master'
alias gplo='git pull origin master'
alias gpob='git push origin master && git push backup master'

export SVN_EDITOR="vim"
export EDITOR="vim"
export MYSQL_SOCKET="/tmp/mysql.sock"

# Ruby Parameters
export RUBY_HEAP_MIN_SLOTS=500000
export RUBY_HEAP_SLOTS_INCREMENT=250000
export RUBY_HEAP_SLOTS_GROWTH_FACTOR=1
export RUBY_GC_MALLOC_LIMIT=50000000

# Textmate Rubygems
_mategem()
{
    local curw
    COMPREPLY=()
    curw=${COMP_WORDS[COMP_CWORD]}
    local gems="$(gem environment gemdir)/gems"
    COMPREPLY=($(compgen -W '$(ls $gems)' -- $curw));
    return 0
}
complete -F _mategem -o dirnames mategem

complete -C $BASE_DIR/dotfiles/rake_completion -o default rake
complete -C $BASE_DIR/dotfiles/capistrano_completion -o default cap

if [ -f $BASE_DIR/etc/bash_completion ]; then
   . $BASE_DIR/etc/bash_completion
fi

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
  ulimit -Sn 1024
  export PS1="$CYAN_E\w$YELLOW_E \$(parse_git_branch)$WHITE_E $\[\033[00m\] "

  # Android SDK
  export PATH=/Users/oliver/Developer/android-sdk-mac/tools:$PATH

  # Cinderella
  if [[ -d $HOME/Developer ]]; then
    PATH="$HOME/Developer/bin:$HOME/Developer/share/npm/bin:$HOME/Developer/sbin:$PATH"; export PATH
    MANPATH="$HOME/share/man:$MANPATH"; export MANPATH
    CFLAGS="-I$HOME/Developer/include"; export CFLAGS
    CPPFLAGS="-I$HOME/Developer/include"; export CPPFLAGS
    CXXFLAGS="-I$HOME/Developer/include"; export CXXFLAGS
    LDFLAGS="-L$HOME/Developer/lib"; export LDFLAGS
    NODE_PATH="$HOME/Developer/lib/node"; export NODE_PATH

    export CONFIGURE_ARGS="--with-cflags='$CFLAGS' --with-ldflags='$LDFLAGS'"

    if [[ -d $HOME/Developer/Cellar/python/2.7/bin ]]; then
      export PATH=$HOME/Developer/Cellar/python/2.7/bin:$PATH
    fi
  fi
else
  export PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '
  alias ls='ls --color=auto'
  alias grep='grep --color=auto'
  alias ll='ls -lh'
  alias la='ls -Alh'
  alias l='ls -CF'
fi

# Lion Fix
# export CC=/usr/bin/gcc-4.2

alias reload='. ~/.bashrc'
alias edit_profile='vim ~/.bashrc'

# rbenv Setup
# export PATH="$HOME/.rbenv/bin:$PATH"
# eval "$(rbenv init -)"

# RVM Setup
[[ -s "/Users/oliver/.rvm/scripts/rvm" ]] && . "/Users/oliver/.rvm/scripts/rvm"

PATH=$PATH:$HOME/.rvm/bin # Add RVM to PATH for scripting

[[ -s $HOME/.tmuxinator/scripts/tmuxinator ]] && source $HOME/.tmuxinator/scripts/tmuxinator

