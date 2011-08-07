TITLEBAR="\033]2;\W\007"
START_COLOR="\[\033[42;1;30m\]"
STOP_COLOR="\[\033[0m\]"
PS1="${TITLEBAR}${START_COLOR}[ \w ]${STOP_COLOR}\n$ "
export CLICOLOR=1
HISTCONTROL=ignoredups

alias grep='grep --color=auto -i'

alias g='git'
alias ga='git add'
alias gc='git commit -v'
alias gs='git status'
alias gd='git diff'

alias ll='ls -l'
alias remux='ffmpeg -vcodec copy -acodec copy -i'
alias unset.executable.bit.for.regular.files='find . -type f -print0 | xargs -0 chmod -x'

add_to_path() {
    export PATH=$1:$PATH    
}

add_to_path "$HOME/local/bin"

# Homebrew
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
