if [[ "$TERM_PROGRAM" == "iTerm.app" ]]; then
  if [[ ! -f ~/.iterm2_shell_integration.zsh ]]; then
    curl -L https://iterm2.com/shell_integration/zsh -o ~/.iterm2_shell_integration.zsh
  fi
  source ~/.iterm2_shell_integration.zsh
fi
