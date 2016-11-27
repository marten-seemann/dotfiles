# enable thefuck (https://github.com/nvbn/thefuck)
if (( $+commands[thefuck] )) ; then
  eval $(thefuck --alias)
fi
