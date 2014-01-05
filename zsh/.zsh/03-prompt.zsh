CURRENT_BG='NONE'

# Begin a segment
# Takes two arguments, background and foreground. Both can be omitted,
# rendering default background/foreground.
prompt_segment() {
  # echo -n $3
  local bg fg
  [[ -n $1 ]] && bg="%K{$1}" || bg="%k"
  [[ -n $2 ]] && fg="%F{$2}" || fg="%f"
  if [[ $CURRENT_BG != 'NONE' && $1 != $CURRENT_BG ]]; then
    echo -n "%{$bg%F{$CURRENT_BG}%}%{$fg%}"
  else
    echo -n "%{$bg%}%{$fg%}"
  fi
  CURRENT_BG=$1
  [[ -n $3 ]] && echo -n $3
}

# End the prompt, closing any open segments
prompt_end() {
  prompt_segment default red "→"
  echo -n "%{%k%}"
  echo -n "%{%f%}"
  CURRENT_BG=''
}


# Context: user@hostname (who am I and where am I)
# username will be omitted if it matches the environment variable DEFAULT_USER
prompt_context() {
  local user=`whoami`
  local hostname=`hostname`

  if [[ "$hostname" != "$DEFAULT_HOST" ]]; then
    if [[ "$user" != "$DEFAULT_USER" ]]; then
      prompt_segment default yellow "%(!.%{%F{yellow}%}.)$user"
      prompt_segment default white "@"
    fi
    prompt_segment default green "%B%M%b"
    echo -n " "
  fi
}

# Dir: current working directory
prompt_dir() {
  prompt_segment black blue '%B%~%b'
  prompt_segment default default " "
}

## Main prompt
build_prompt() {
  RETVAL=$?
  prompt_context
  prompt_dir
  prompt_end
}

PROMPT='%{%f%b%k%}$(build_prompt) '
