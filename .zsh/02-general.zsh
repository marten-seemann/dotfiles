# enable autojump
[[ -s `brew --prefix`/etc/autojump.sh ]] && . `brew --prefix`/etc/autojump.sh

# Shell options
export LSCOLORS="" # reset colors set by oh-my-zsh

export TERM='xterm-color'
export EDITOR=vim

export WORDCHARS='*?[]~&;!$%^<>'

export PYTHONPATH=/usr/local/lib/python2.7/site-packages

bindkey "^[[1;3C" forward-word
bindkey "^[[1;3D" backward-word

# correct_all sometimes recommends corrections at the wrong places
unsetopt correct_all
setopt correct

