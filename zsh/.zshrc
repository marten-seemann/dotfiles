case $OSTYPE in
  darwin*) osdir=mac ;;
  linux*) osdir=linux ;;
  *) osdir= ;;
esac

for prefix in {00..99}; do
  for config_file in ~/.zsh/$prefix-*.zsh(N); do
    source "$config_file"
  done
  if [[ -n $osdir && -d ~/.zsh/$osdir ]]; then
    for config_file in ~/.zsh/$osdir/$prefix-*.zsh(N); do
      source "$config_file"
    done
  fi
done

autoload -Uz compinit
for dump in ~/.zcompdump(N.mh+24); do
  compinit
done
compinit -C
