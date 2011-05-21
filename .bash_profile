
add_to_path() {
    PATH=$1:$PATH    
}

source_if_exists() {
    if [ -f "$1" ]; then
        source "$1"
    fi
}

add_to_path "/usr/local/bin"
add_to_path "/usr/local/sbin"
add_to_path "/usr/local/Cellar/python/2.7.1/bin"
add_to_path "$HOME/local/bin"

PYTHONPATH="$HOME/local/pythonpath:$PYTHONPATH"

# Node.js
NODE_PATH="/usr/local/lib/node"
# NPM
add_to_path "/usr/local/share/npm/bin"

# Gems
GEM_HOME=$HOME/.gem/ruby/1.8
add_to_path "$GEM_HOME/bin"

source ~/.bashrc

source_if_exists `brew --prefix`/etc/bash_completion
source_if_exists `brew --prefix`/etc/autojump

source ~/local/Cellar/rails_completion/rails.bash
source ~/local/Cellar/completion-ruby/completion-rake
