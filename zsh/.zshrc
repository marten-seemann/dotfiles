source <(antibody init)

export ANTIBODY_HOME="$(antibody home)"

antibody bundle < ~/.zsh/zsh-plugins.txt

for file in ~/.zsh/*.zsh; do
  source "$file"
done

if [ ! -f ~/.iterm2_shell_integration.zsh ]; then
  curl -L https://iterm2.com/shell_integration/zsh -o ~/.iterm2_shell_integration.zsh
fi
source ~/.iterm2_shell_integration.zsh
