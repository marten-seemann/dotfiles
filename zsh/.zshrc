for file in ~/.zsh/*.zsh; do
  source "$file"
done

test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"
