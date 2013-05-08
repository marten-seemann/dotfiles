function clean_contextmenu() {
  /System/Library/Frameworks/CoreServices.framework/Versions/A/Frameworks/LaunchServices.framework/Versions/A/Support/lsregister -kill -r -domain local -domain user
  killall Finder
  echo "Open With has been rebuilt, Finder will relaunch"
}

update() {
  brew update
  brew upgrade
  brew cleanup
  gem update
  rbenv rehash
  npm update
  _update_dotfiles_submodules
}

function manp() {
  man -t $@ | open -f -a /Applications/Preview.app
}
