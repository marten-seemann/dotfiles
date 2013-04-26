autoload -U compinit
fpath=(/usr/local/share/zsh-completions $fpath)
compinit
zmodload zsh/complist
zstyle ':completion:*' menu select
bindkey -M menuselect ' ' accept-and-infer-next-history
bindkey -M menuselect '^?' undo
