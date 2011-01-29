export JAVA_HOME="/System/Library/Frameworks/JavaVM.framework/Versions/1.6/Home"
export ANT_HOME="~/bin/ant"
alias dotfiles='cd ~/bin/dotfiles'

export LSCOLORS=GxGxcxdxCxegedabagacad
export CLICOLOR=1
alias ls='ls -G'
alias ll='ls -lhG'
alias la='ls -lahG'

# Rails Aliases
function sc () {
  if [ -f ./script/rails ]; then 
    rails c $@
  else
    ./script/console $@
  fi
}

function sd () {
  if [ -f ./script/rails ]; then
    rails s --debugger $@  
  else
    ./script/server --debugger
  fi
}

function s () {
  if [ -f ./script/rails ]; then 
    rails s $@
  else
    ./script/server $@
  fi
}

# Git Aliases
alias gs='git status'
alias gr='git svn rebase'
alias gdc='git svn dcommit'
alias gpso='git push origin master'
alias gplo='git pull origin master'
alias gpob='git push origin master && git push backup master'

#PORTS_SYSTEM_TO_USE=macports
#MACPORTS_PATH=/opt/local/bin:/opt/local/sbin
#HOMEBREW_PATH=~/bin/homebrew/bin
#REGULAR_PATH=$ANT_HOME/bin:$EC2_HOME/bin:$PATH

#if [ "$PORTS_SYSTEM_TO_USE" == "macports" ]; then
#  export PATH=$MACPORTS_PATH:$REGULAR_PATH
#fi

#if [ "$PORTS_SYSTEM_TO_USE" == "homebrew" ]; then
#  export PATH=$HOMEBREW_PATH:$REGULAR_PATH
#fi

#export MANPATH=/opt/local/share/man:~/bin/homebrew/share/man:$MANPATH

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

complete -C ~/bin/dotfiles/rake_completion -o default rake
complete -C ~/bin/dotfiles/capistrano_completion -o default cap

if [ -f $HOME/Developer/etc/bash_completion ]; then
   . $HOME/Developer/etc/bash_completion
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

# RVM Setup
if [ -s ~/.rvm/scripts/rvm ] ; then
  source ~/.rvm/scripts/rvm
  rvm use ree
fi

# Git & Bash
function parse_git_branch {
	git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/(\1)/'
}

# Depends on /opt/local/etc/bash_completion => port install
export PS1="$CYAN_E\w$YELLOW_E \$(parse_git_branch)$WHITE_E $\[\033[00m\] "

alias reload='. ~/.bashrc'
alias edit_profile='vim ~/.bashrc'


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
