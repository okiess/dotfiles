if [ -f $HOME/.bashrc ]; then
  . $HOME/.bashrc
fi

unamestr=`uname`
if [[ "$unamestr" == 'Darwin' ]]; then

# {{{
# Node Completion - Auto-generated, do not touch.
shopt -s progcomp
for f in $(command ls ~/.node-completion); do
  f="$HOME/.node-completion/$f"
  test -f "$f" && . "$f"
done
# }}}

fi
