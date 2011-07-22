TITLEBAR='\033]2;\W\007'
PS1="${TITLEBAR}[ \[\033[01;34m\]\w\[\033[00m\] ]\n$ "
export CLICOLOR=1
HISTCONTROL=ignoredups

alias grep='grep --color=auto -i'

alias g='git'
alias ga='git add'
alias gc='git commit -v'
alias gs='git status'
alias gd='git diff'

alias ll='ls -l'
alias repack='ffmpeg -vcodec copy -acodec copy -i'
alias unset.executable.bit.for.regular.files='find . -type f -print0 | xargs -0 chmod -x'

add_to_path() {
    export PATH=$1:$PATH    
}

add_to_path "$HOME/local/bin"

# Homebrew
alias brew.update='brew update && brew outdated'
alias brew.upgrade='brew outdated | cut -f 1 | xargs brew install'
add_to_path "/usr/local/bin"
add_to_path "/usr/local/sbin"

# Python
add_to_path "/usr/local/share/python"
export PYTHONPATH="$HOME/local/pythonpath:$PYTHONPATH"

# Node.js
export NODE_PATH="/usr/local/lib/node"
# NPM
add_to_path "/usr/local/share/npm/bin"
alias watch.vows="watchr $HOME/local/bin/vows.watchr"
alias continuously.run.jasmine.specs="watchr $HOME/local/bin/jasmine-node.watchr"

# Ruby
[[ -s "$HOME/.rvm/scripts/rvm" ]] && . "$HOME/.rvm/scripts/rvm" # Load RVM function

source `brew --prefix`/etc/autojump

source "$HOME/.bash_completion"
