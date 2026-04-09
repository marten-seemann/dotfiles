update() {
  apt update
  apt upgrade
  apt autoremove 
  echo "Updating antidote..."
  antidote update
  reload
}
