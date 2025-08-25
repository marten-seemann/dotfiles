# Shell options
export LANG=en_US.utf8
export TERM=xterm-256color
export EDITOR=vim

export WORDCHARS='*?[]~&;!$%^<>'

bindkey "^[[1;3C" forward-word
bindkey "^[[1;3D" backward-word
bindkey '^A' beginning-of-line
bindkey '^E' end-of-line

# correct_all sometimes recommends corrections at the wrong places
unsetopt correct_all
setopt correct

# show the host name in the tab title for SSH sessions
if (( P9K_SSH )); then
  export PROMPT_COMMAND="echo -ne '\033]0;${USER}@${HOST}\007';$PROMPT_COMMAND"
else
  # TODO: reset when disconnecting
fi
precmd() { eval "$PROMPT_COMMAND" }
