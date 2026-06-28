unamestr=`uname`

if [[ "$unamestr" == 'Darwin' ]]; then
  . $BASE_DIR/dotfiles/darwin
else
  . $BASE_DIR/dotfiles/linux
fi
