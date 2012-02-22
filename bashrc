#!/bin/bash

function script_dir() {
    local script_path=${BASH_SOURCE[0]}
    while [ -h "$script_path" ] ; do script_path="$(readlink "$script_path")"; done
    echo "$(cd -P "$(dirname "$script_path")" && pwd)"
}
readonly SCRIPT_DIR="$(script_dir)"

# Load modules
for module in "$SCRIPT_DIR/modules"/*; do
    for file in "$module"/*; do
        source "$file"
    done
done


add_to_path "$HOME/local/bin"

alias grep='grep --color=auto -i'

alias la='ls -a'
alias ll='ls -l'
alias remux='ffmpeg -vcodec copy -acodec copy -i'
alias unset.executable.bit.for.regular.files='find . -type f -print0 | xargs -0 chmod -x'
alias convert.new.lines.to.nul="tr '\n' '\0'"

