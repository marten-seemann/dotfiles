source <(antibody init)

export ANTIBODY_HOME="$(antibody home)"

for file in ~/.zsh/*.zsh; do
  source "$file"
done

antibody bundle < ~/.zsh/zsh-plugins.txt

if [ ! -f ~/.iterm2_shell_integration.zsh ]; then
  curl -L https://iterm2.com/shell_integration/zsh -o ~/.iterm2_shell_integration.zsh
fi
source ~/.iterm2_shell_integration.zsh
