export PROMPT='%B%F{green}$(hostname | perl -pe "s/m4r73n.*//; s/(\w)\$/\$1 /")%F{blue}$(pwd | perl -pe "s|^$HOME|~|g; s|/([^/])[^/]*(?=/)|/\$1|g") %F{red}→%f%b '
