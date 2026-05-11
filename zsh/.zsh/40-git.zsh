alias ga='git add'
alias gcb='git checkout -b'
alias gco='git checkout'
alias gp='git push'

function gcm {
  local default
  default=$(git symbolic-ref --short refs/remotes/origin/HEAD 2>/dev/null) || {
    echo "gcm: not a git repo or no origin/HEAD set" >&2
    return 1
  }
  git checkout "${default#origin/}"
}
