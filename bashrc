TITLEBAR='\033]2;\W\007'
PS1="${TITLEBAR}[ \[\033[01;34m\]\w\[\033[00m\] ]\n$ "
export CLICOLOR=1
HISTCONTROL=ignoredups

alias grep='grep --color=auto -i'

alias g='git'
alias ga='git add'
alias gc='git commit'
alias gs='git status'

alias ll='ls -l'
alias repack='ffmpeg -vcodec copy -acodec copy -i'
alias mount.pensieve='encfs ~/.pensieve_encrypted/ ~/.pensieve'
alias unset.executable.bit.for.regular.files='find . -type f -print0 | xargs -0 chmod -x'

add_to_path() {
    export PATH=$1:$PATH    
}

source_if_exists() {
    if [ -f "$1" ]; then
        source "$1"
    fi
}

add_to_path "$HOME/local/bin"

add_to_path "$HOME/Applications/android-sdk-mac_x86_r12/platform-tools"

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

source_if_exists `brew --prefix`/etc/autojump

# Bash completion
export BASH_COMPLETION_DIR="$HOME/local/bash_completion.d"
for i in $(LC_ALL=C command ls "$BASH_COMPLETION_DIR"); do
    source "$BASH_COMPLETION_DIR/$i"
done
