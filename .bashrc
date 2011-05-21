PS1="[ \[\033[01;34m\]\W\[\033[00m\] ]\n$ "
export CLICOLOR=1
HISTCONTROL=ignoredups

alias grep='grep --color=auto -i'
alias g='git'
alias gs='git status'
alias ll='ls -l'
alias watch.vows="watchr $HOME/local/bin/vows.watchr"
alias repack='ffmpeg -vcodec copy -acodec copy -i'
alias mount.pensieve='encfs ~/.pensieve_encrypted/ ~/.pensieve'

add_to_path() {
    export PATH=$1:$PATH    
}

source_if_exists() {
    if [ -f "$1" ]; then
        source "$1"
    fi
}

add_to_path "$HOME/local/bin"

# Homebrew
alias brew.update='brew update && brew outdated'
alias brew.upgrade='brew outdated | cut -f 1 | xargs brew install'
add_to_path "/usr/local/bin"
add_to_path "/usr/local/sbin"

# Python
add_to_path "/usr/local/Cellar/python/2.7.1/bin"
export PYTHONPATH="$HOME/local/pythonpath:$PYTHONPATH"

# Node.js
export NODE_PATH="/usr/local/lib/node"
# NPM
add_to_path "/usr/local/share/npm/bin"

# Gems
export GEM_HOME=$HOME/.gem/ruby/1.8
add_to_path "$GEM_HOME/bin"

source_if_exists `brew --prefix`/etc/autojump

# Bash completion
source_if_exists `brew --prefix`/etc/bash_completion
source ~/local/Cellar/rails_completion/rails.bash
source ~/local/Cellar/completion-ruby/completion-rake
