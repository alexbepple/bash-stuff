PS1="[ \[\033[01;34m\]\W\[\033[00m\] ]\n$ "

export CLICOLOR=1
HISTCONTROL=ignoredups

alias grep='grep --color=auto -i'

alias g='git'
alias gs='git status'

alias ll='ls -l'

alias watch.vows="watchr $HOME/local/bin/vows.watchr"

alias repack='ffmpeg -vcodec copy -acodec copy -i'

alias brew.update='brew update && brew outdated'
alias brew.upgrade='brew outdated | cut -f 1 | xargs brew install'

alias mount.pensieve='encfs ~/.pensieve_encrypted/ ~/.pensieve'

