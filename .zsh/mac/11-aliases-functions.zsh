function clean_contextmenu() {
  /System/Library/Frameworks/CoreServices.framework/Versions/A/Frameworks/LaunchServices.framework/Versions/A/Support/lsregister -kill -r -domain local -domain user
  killall Finder
  echo "Open With has been rebuilt, Finder will relaunch"
}

update() {
  # gem update
  # rbenv rehash
  brew update
  brew upgrade
  brew cleanup
  npm update
  update_dotfiles_submodules
}
