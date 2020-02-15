update() {
  apt update
  apt upgrade
  apt autoremove 
  echo "Updating antibody..."
  antibody update
  reload
}
