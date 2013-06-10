bindkey "\e\e[D" backward-word # alt + <-
bindkey "\e\e[C" forward-word # alt + ->

bindkey "^H"    run-help
bindkey ' ' magic-space
bindkey -M menuselect '^?' undo
