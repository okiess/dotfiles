export JAVA_HOME="/System/Library/Frameworks/JavaVM.framework/Versions/1.6/Home"
export GROOVY_HOME="~/bin/groovy-1.5.6"
export GRAILS_HOME="~/bin/grails-1.0.3"
export ANT_HOME="~/bin/apache-ant-1.7.0"
export EC2_HOME="~/bin/ec2/ec2-api-tools"
export JRUBY_HOME="~/bin/jruby"
export SCALA_HOME="/opt/local/share/scala"
export M2_HOME="~/Applications/liftweb-1.0/apache-maven"
export M2=$M2_HOME/bin
export MAVEN_OPTS="-noverify -javaagent:~/Applications/liftweb-1.0/java-rebel/javarebel.jar"

alias dotfiles='cd ~/bin/dotfiles'
alias ll='ls -lh'
alias la='ls -lah'
alias pass='gpg -d ~/pass.gpg'
alias mysql='mysql5'

# Rails Aliases
alias s='script/server'
alias s2='script/server -p 3001'
alias sc='script/console'
alias sd='script/server --debugger'
alias u='svn up'
alias dbu='rake db:migrate'
# alias cap1='cap _1.4.1_'

# Git Aliases
alias gs='git status'
alias gr='git svn rebase'
alias gdc='git svn dcommit'
alias gpo='git push origin master'
alias gpob='git push origin master && git push backup master'

export PATH=/opt/local/bin:/opt/local/sbin:$ANT_HOME/bin:$MYSQL_HOME/bin:$GROOVY_HOME/bin:$GRAILS_HOME/bin:$S3SYNC_HOME:$EC2_HOME/bin:$M2:$PATH
export MANPATH=/opt/local/share/man:$MANPATH
#export PATH=$JRUBY_HOME/bin:$PATH

export SVN_EDITOR="vim"
export EDITOR="vim"
export MYSQL_SOCKET="/opt/local/var/run/mysql5/mysqld.sock"
