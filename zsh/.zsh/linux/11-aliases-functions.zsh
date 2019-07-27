update() {
  apt-get update
  apt-get upgrade
  apt-get autoremove 
  echo "Updating antibody..."
  antibody update
  reload
}
