if [[ `uname` == 'Linux' ]] then
  osdir="linux"
fi

if [[ `uname` == 'Darwin' ]] then
  osdir="mac"
fi

if [[ $osdir != '' ]] then
  for file in ~/.zsh/$osdir/*.zsh; do
    source "$file"
  done
fi