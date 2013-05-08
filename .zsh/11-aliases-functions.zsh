# see http://alias.sh/extract-most-know-archives-one-command
ex () {
    if [ -f $1 ] ; then
      case $1 in
        *.tar.bz2)   tar xjf $1     ;;
        *.tar.gz)    tar xzf $1     ;;
        *.bz2)       bunzip2 $1     ;;
        *.rar)       unrar e $1     ;;
        *.gz)        gunzip $1      ;;
        *.tar)       tar xf $1      ;;
        *.tbz2)      tar xjf $1     ;;
        *.tgz)       tar xzf $1     ;;
        *.zip)       unzip $1       ;;
        *.Z)         uncompress $1  ;;
        *.7z)        7z x $1        ;;
        *)     echo "'$1' cannot be extracted via extract()" ;;
         esac
     else
         echo "'$1' is not a valid file"
     fi
}

# see http://alias.sh/make-and-cd-directory
function mkcd() {
    mkdir -p "$1" && cd "$1";
}

function _update_dotfiles_submodules() {
    cd $HOME && git submodule -q foreach git pull -q origin master && cd - > /dev/null;
}

# see http://cfc.kizzx2.com/index.php/localproject-based-ackrc/
function ack() {
  ackrc=""
  if [ -f ./.ackrc ]
  then
    ackrc1=$(cat ./.ackrc | grep -v '#' | tr '\n' ' ')
    ackrc2=$(cat $HOME/.ackrc | grep -v '#' | tr '\n' ' ')
    ackrc="$ackrc1 $ackrc2"
  fi

  command ack $ackrc $*
}

function localip() {
  ifconfig | grep "inet " | awk '{ print $2 }'
}

