# Shell options
export TERM=xterm-256color
export EDITOR=vim

export WORDCHARS='*?[]~&;!$%^<>'

bindkey "^[[1;3C" forward-word
bindkey "^[[1;3D" backward-word

# correct_all sometimes recommends corrections at the wrong places
unsetopt correct_all
setopt correct
