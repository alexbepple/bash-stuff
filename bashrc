TITLEBAR="\033]2;\W\007"
START_COLOR="\[\033[0;32m\]"
STOP_COLOR="\[\033[0m\]"
PS1="\n${TITLEBAR}${START_COLOR}[ \w ]${STOP_COLOR}\n$ "
export CLICOLOR=1
HISTCONTROL=ignoredups

alias grep='grep --color=auto -i'

alias g='git'
alias gac='git add -A && git commit -v'
alias gc='git commit -v'
alias gs='git status'
alias gd='git diff'

alias la='ls -a'
alias ll='ls -l'
alias remux='ffmpeg -vcodec copy -acodec copy -i'
alias unset.executable.bit.for.regular.files='find . -type f -print0 | xargs -0 chmod -x'
alias convert.new.lines.to.nul="tr '\n' '\0'"

alias locate.updatedb='sudo /usr/libexec/locate.updatedb'

function script_dir() {
    script_path=${BASH_SOURCE[0]}
    while [ -h "$script_path" ] ; do script_path="$(readlink "$script_path")"; done
    echo "$(cd -P "$(dirname "$script_path")" && pwd)"
}

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


# Changing directory
source "$(script_dir)/functions/up"
source `brew --prefix`/etc/autojump


# Page more conveniently and with more color
vim_less="vim -u /usr/share/vim/vim73/macros/less.vim"
alias less="$vim_less"
export MANPAGER="col -b | $vim_less -c 'set ft=man nomod nolist' -"

source "$HOME/.bash_completion"
