function clean_contextmenu() {
  /System/Library/Frameworks/CoreServices.framework/Versions/A/Frameworks/LaunchServices.framework/Versions/A/Support/lsregister -kill -r -domain local -domain user
  killall Finder
  echo "Open With has been rebuilt, Finder will relaunch"
}

update() {
  echo "Updating brew..."
  brew update
  brew upgrade --all
  brew cleanup
  echo "Updating gem..."
  gem update
  echo "Updating rbenv..."
  rbenv rehash
  echo "Updating npm..."
  npm update
  echo "Updating dotfile submodules..."
  _update_dotfiles_submodules
  reload
}

function manp() {
  man -t $@ | open -f -a /Applications/Preview.app
}
