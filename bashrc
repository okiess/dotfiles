export JAVA_HOME="/System/Library/Frameworks/JavaVM.framework/Versions/1.6/Home"
export ANT_HOME="~/bin/apache-ant-1.7.0"
export EC2_HOME="~/bin/ec2/ec2-api-tools"

alias dotfiles='cd ~/bin/dotfiles'

export LSCOLORS=GxGxcxdxCxegedabagacad
export CLICOLOR=1
alias ls='ls -G'
alias ll='ls -lhG'
alias la='ls -lahG'
alias pass='gpg -d ~/pass.gpg'
alias mysql='mysql5'

# Rails Aliases
alias s='script/server'
alias s2='script/server -p 3001'
alias sc='script/console'
alias sd='script/server --debugger'
alias u='svn up'
alias dbu='rake db:migrate'

# Git Aliases
alias gs='git status'
alias gr='git svn rebase'
alias gdc='git svn dcommit'
alias gpo='git push origin master'
alias gpob='git push origin master && git push backup master'

PORTS_SYSTEM_TO_USE=macports
MACPORTS_PATH=/opt/local/bin:/opt/local/sbin
HOMEBREW_PATH=~/bin/homebrew/bin
REGULAR_PATH=$ANT_HOME/bin:$EC2_HOME/bin:$PATH

if [ "$PORTS_SYSTEM_TO_USE" == "macports" ]; then
  export PATH=$MACPORTS_PATH:$REGULAR_PATH
fi

if [ "$PORTS_SYSTEM_TO_USE" == "homebrew" ]; then
  export PATH=$HOMEBREW_PATH:$REGULAR_PATH
fi

export MANPATH=/opt/local/share/man:~/bin/homebrew/share/man:$MANPATH

export SVN_EDITOR="vim"
export EDITOR="vim"
export MYSQL_SOCKET="/opt/local/var/run/mysql5/mysqld.sock"

# Ruby Parameters
export RUBY_HEAP_MIN_SLOTS=500000
export RUBY_HEAP_SLOTS_INCREMENT=250000
export RUBY_HEAP_SLOTS_GROWTH_FACTOR=1
export RUBY_GC_MALLOC_LIMIT=50000000

# Edge Rails
function edgie() {
  ruby ~/workspace/external-versioned/rails/railties/bin/rails $1
}

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

if [ -f /opt/local/etc/bash_completion ]; then
   . /opt/local/etc/bash_completion
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

if [ -f $HOME/.amazon ]; then
  . $HOME/.amazon
fi

# RVM Setup
if [ -s ~/.rvm/scripts/rvm ] ; then source ~/.rvm/scripts/rvm ; fi

# Set default RVM ruby
rvm use ree

# Git & Bash
function parse_git_branch {
	git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/(\1)/'
}

# Depends on /opt/local/etc/bash_completion => port install
export PS1="$CYAN_E\w$YELLOW_E \$(parse_git_branch)$WHITE_E $\[\033[00m\] "

alias reload='. ~/.bashrc'
alias edit_profile='vim ~/.bashrc'

function load_cinderella {
  source ~/.cinderella.profile
}

