source <(antibody init)

export ANTIBODY_HOME="$(antibody home)"

for file in ~/.zsh/*.zsh; do
  source "$file"
done

antibody bundle < ~/.zsh/zsh-plugins.txt

test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"
