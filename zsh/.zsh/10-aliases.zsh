alias _=sudo
alias o='open .'
alias s='subl -n'

alias l='ll'
alias la='ls -la'
alias lt='ls -ltr'
alias ldir="ls -l | egrep '^d'"

alias grep='grep --color=auto'

alias t=trash

alias timestamp='date +%s'

alias reload='source ~/.zshrc'
alias pg='ping 8.8.8.8'
alias pg6='ping6 2001:4860:4860::8888'
alias remoteip='dig +short myip.opendns.com @resolver1.opendns.com'
alias rm_dsstore="find . -name '*.DS_Store' -type f -delete"
alias wget='wget --content-disposition'
alias diff=colordiff
alias sdiff="git diff --color-words --no-index"
alias ccat=vimcat
alias cx='chmod +x'

# git stuff
alias gs='git status -sb'
alias gl="git log --graph --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen (%cr) %C(bold blue)%Creset' --abbrev-commit"

# Directory traversal
alias ..='cd ..'
alias ...='cd ../../'
alias ....='cd ../../../'
alias .....='cd ../../../../'
alias ......='cd ../../../../../'
alias .......='cd ../../../../../../'
alias ..1='cd ..'
alias ..2='cd ../../../'
alias ..3='cd ../../../../'
alias ..4='cd ../../../../'
alias ..5='cd ../../../../../'
