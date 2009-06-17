export JAVA_HOME="/System/Library/Frameworks/JavaVM.framework/Versions/1.6/Home"
export GROOVY_HOME="/Users/oliver/bin/groovy-1.5.6"
export GRAILS_HOME="/Users/oliver/bin/grails-1.0.3"
export S3SYNC_HOME="/Users/oliver/bin/s3sync"
export ANT_HOME="/Users/oliver/bin/apache-ant-1.7.0"
export EC2_HOME="/Users/oliver/bin/ec2"
export JRUBY_HOME="/Users/oliver/bin/jruby"

alias ll='ls -lh'
alias la='ls -lah'
alias s='script/server'
alias sc='script/console'
alias sd='script/server --debugger'
alias s2='script/server -p 3001'
alias u='svn up'
alias dbu='rake db:migrate'
alias pass='gpg -d /Users/oliver/pass.gpg'
alias a='autotest -rails'
alias mysql='mysql5'
alias cap1='cap _1.4.1_'
alias gs='git status'
alias gr='git svn rebase'
alias gdc='git svn dcommit'
alias gpo='git push origin master'
alias gpob='git push origin master && git push backup master'

export PATH=/opt/local/bin:/opt/local/sbin:$ANT_HOME/bin:$MYSQL_HOME/bin:$GROOVY_HOME/bin:$GRAILS_HOME/bin:$S3SYNC_HOME:$EC2_HOME/bin:$PATH

# export PATH=$JRUBY_HOME/bin:$PATH

export SVN_EDITOR="vim"
export MYSQL_SOCKET="/opt/local/var/run/mysql5/mysqld.sock"

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

# Git & Bash
function parse_git_branch {
	git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/(\1)/'
}

# Depends on /opt/local/etc/bash_completion => port install
export PS1="$CYAN_E\w$YELLOW_E $(parse_git_branch)$WHITE_E $\[\033[00m\] "

alias reload='. ~/.profile'
alias edit_profile='vim ~/.profile'
