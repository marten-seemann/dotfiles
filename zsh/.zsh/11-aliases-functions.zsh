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

# create a backup copy
cpb() { cp $@{,.bak} ;}

# remove host identification from ssh
rmhost() {
  ssh-keygen -f "$HOME/.ssh/known_hosts" -R $1
}

# see https://chris-lamb.co.uk/posts/can-you-get-cp-to-give-a-progress-bar-like-wget
cp_p()
{
   strace -q -ewrite cp -- "${1}" "${2}" 2>&1 \
      | awk '{
        count += $NF
            if (count % 10 == 0) {
               percent = count / total_size * 100
               printf "%3d%% [", percent
               for (i=0;i<=percent;i++)
                  printf "="
               printf ">"
               for (i=percent;i<100;i++)
                  printf " "
               printf "]\r"
            }
         }
         END { print "" }' total_size=$(stat -c '%s' "${1}") count=0
}

# see http://alias.sh/make-and-cd-directory
function mkcd() {
    mkdir -p "$1" && cd "$1";
}

function _update_dotfiles_submodules() {
    cd $HOME/dotfiles
    git submodule -q foreach git pull -q origin master
    cd - > /dev/null
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

# function du() {
#   command du $1 | colout "^\s*\w+\s" red
# }

function ffind() {
  find . -name "*$1*" | colout "$1"
}

function localip() {
  ifconfig | grep "inet " | awk '{ print $2 }'
}

# see http://alias.sh/node/816function
function rdns() {
    dig +short $1 | xargs -L 5 nslookup | grep name
}

#get image dimensions
function dim() {
  sips $1 -g pixelWidth -g pixelHeight
}

# open Google Chrome with an empty profile
function chrome_empty() {
  tmpdir=`mktemp -d -t chrome`
  /Applications/Google\ Chrome.app/Contents/MacOS/Google\ Chrome --user-data-dir=$tmpdir
}

function geoip {
  curl -D - http://freegeoip.net/xml/$1;
}

function webstats () {
  local site=$1
  echo $site
  echo ${site} | sed -n 's/./-/gp'
  curl -w '
  Lookup time:\t%{time_namelookup} s
  Connect time:\t%{time_connect} s
  Pretransfer time:\t%{time_pretransfer} s
  Starttransfer time:\t%{time_starttransfer} s
  Size download:\t%{size_download} bytes
  Speed download:\t%{speed_download} bytes/s

  Total time:\t%{time_total} s
  ' -o /dev/null -s $site
  echo
}
}
