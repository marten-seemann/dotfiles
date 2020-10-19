alias ls='ls -Gh'
alias df='dfc'

alias subl="/Applications/Sublime\ Text.app/Contents/MacOS/Sublime\ Text"
alias vlc="/Applications/VLC.app/Contents/MacOS/VLC"

alias t=trash

# OS X has no `md5sum`, so use `md5` as a fallback
command -v md5sum > /dev/null || alias md5sum="md5"

# OS X has no `sha1sum`, so use `shasum` as a fallback
command -v sha1sum > /dev/null || alias sha1sum="shasum"

# Disable Spotlight
alias spotoff="sudo mdutil -a -i off"
# Enable Spotlight
alias spoton="sudo mdutil -a -i on"

#open iOS Simulator
alias ios="/Applications/Xcode.app/Contents/Developer/Applications/Simulator.app/Contents/MacOS/Simulator"
