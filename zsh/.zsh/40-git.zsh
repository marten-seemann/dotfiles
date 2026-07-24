alias gs='git status -sb'
alias gl="git log --graph --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen (%cr) %C(bold blue)%Creset' --abbrev-commit"
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
