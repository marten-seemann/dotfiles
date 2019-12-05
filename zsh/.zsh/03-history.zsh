HISTSIZE=100000
HISTFILE=~/.zsh_history
SAVEHIST=$HISTSIZE

setopt extended_history       # record timestamp of command in HISTFILE
setopt hist_expire_dups_first # delete duplicates first when HISTFILE size exceeds HISTSIZE
setopt hist_ignore_dups       # ignore duplicated commands history list
setopt hist_ignore_space      # ignore commands that start with space
setopt hist_verify            # show command with history expansion to user before running it
setopt appendhistory          # append history to the history file (no overwriting)
setopt incappendhistory       # immediately append to the history file, not just when a term is killed
