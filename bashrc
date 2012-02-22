TITLEBAR="\033]2;\W\007"
START_COLOR="\[\033[0;32m\]"
STOP_COLOR="\[\033[0m\]"
PS1="\n${TITLEBAR}${START_COLOR}[ \w ]${STOP_COLOR}\n$ "
export CLICOLOR=1
HISTCONTROL=ignoredups

alias grep='grep --color=auto -i'

alias la='ls -a'
alias ll='ls -l'
alias remux='ffmpeg -vcodec copy -acodec copy -i'
alias unset.executable.bit.for.regular.files='find . -type f -print0 | xargs -0 chmod -x'
alias convert.new.lines.to.nul="tr '\n' '\0'"

function script_dir() {
    local script_path=${BASH_SOURCE[0]}
    while [ -h "$script_path" ] ; do script_path="$(readlink "$script_path")"; done
    echo "$(cd -P "$(dirname "$script_path")" && pwd)"
}
readonly SCRIPT_DIR="$(script_dir)"

function add_to_path() {
    export PATH=$1:$PATH    
}

add_to_path "$HOME/local/bin"

# Load modules
for module in "$SCRIPT_DIR/modules"/*; do
    for file in "$module"/*; do
        source "$file"
    done
done

# Python
add_to_path "/usr/local/share/python"
export PYTHONPATH="$HOME/local/pythonpath:$PYTHONPATH"

# Ruby
add_to_path "$HOME/.gem/ruby/1.8/bin"

# Node.js
export NODE_PATH="/usr/local/lib/node_modules"
# NPM
add_to_path "/usr/local/share/npm/bin"
alias watch.vows="watchr $HOME/local/bin/vows.watchr"
alias continuously.run.jasmine.specs="watchr $HOME/local/bin/jasmine-node.watchr"

# Gradle
export GRADLE_OPTS="-Dorg.gradle.daemon=true"

# Change directory
source "$SCRIPT_DIR/functions/up"
source "$BREW/etc/autojump"

# Page more conveniently and with more color
vim_less="vim -u /usr/share/vim/vim73/macros/less.vim"
alias less="$vim_less"
export MANPAGER="col -b | $vim_less -c 'set ft=man nomod nolist' -"

export BASH_COMPLETION_DIR="$SCRIPT_DIR/bash_completion.d"
export BASH_COMPLETION_COMPAT_DIR="$BASH_COMPLETION_DIR"
source "$BREW/etc/bash_completion"
