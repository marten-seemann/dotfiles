source <(antibody init)

export ANTIBODY_HOME="$(antibody home)"

antibody bundle < ~/.zsh/zsh-plugins.txt

for file in ~/.zsh/*.zsh; do
  source "$file"
done

autoload -Uz compinit
for dump in ~/.zcompdump(N.mh+24); do
  compinit
done
compinit -C

if [ ! -f ~/.iterm2_shell_integration.zsh ]; then
  curl -L https://iterm2.com/shell_integration/zsh -o ~/.iterm2_shell_integration.zsh
fi
source ~/.iterm2_shell_integration.zsh
