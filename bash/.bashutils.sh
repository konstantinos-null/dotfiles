#!/bin/bash
os_type=`uname`
if [ $os_type = "Darwin" ]; then
    [ -f ~/.fzf.bash ] && source ~/.fzf.bash
elif [ $os_type = "Linux" ]; then
    source /usr/share/doc/fzf/examples/completion.bash 
    source /usr/share/doc/fzf/examples/key-bindings.bash
fi

if [ $os_type = "Darwin" ]; then
    [ -f /opt/homebrew/etc/profile.d/autojump.sh ] && source /opt/homebrew/etc/profile.d/autojump.sh
elif [ $os_type = "Linux" ]; then
    source /usr/share/autojump/autojump.sh
fi

if [ $os_type = "Darwin" ]; then
    TERM="screen-256color"
elif [ $os_type = "Linux" ]; then
    TERM="tmux-256color"
fi

# source ~/.*_comp.sh

# Inspiration taken from /etc/profile
for i in ~/completions/.*_comp.sh; do
    if [ -r $i ]; then
      source $i
    fi
done
unset i
