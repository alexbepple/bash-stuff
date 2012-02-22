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
        if [ -x $file ]; then
            source "$file"
        fi
    done
done

