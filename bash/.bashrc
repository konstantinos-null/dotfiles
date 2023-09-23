# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples

# If not running interactively, don't do anything
case $- in
    *i*) ;;
      *) return;;
esac

# don't put duplicate lines or lines starting with space in the history.
# See bash(1) for more options
HISTCONTROL=ignoreboth:ignoredups:erasedups

# append to the history file, don't overwrite it
shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=9000
HISTFILESIZE=9999

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# set variable identifying the chroot you work in (used in the prompt below)
if [ -z "${debian_chroot:-}" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi

# set a fancy prompt (non-color, unless we know we "want" color)
case "$TERM" in
    xterm-color|*-256color) color_prompt=yes;;
esac

#force_color_prompt=yes

#if [ -n "$force_color_prompt" ]; then
#    if [ -x /usr/bin/tput ] && tput setaf 1 >&/dev/null; then
#	color_prompt=yes
#    else
#	color_prompt=
#    fi
#fi

# source ~/.gitbash
source ~/.bashcolors.sh

#if [ "$color_prompt" = yes ]; then
#    PS1="${debian_chroot:+($debian_chroot)}\[$COLOR_GREEN\]\u@\h\[$COLOR_WHITE\]:\[$COLOR_PURPLE\]\w\[$COLOR_RESET\]\$(git_branch)$ \t \[$COLOR_RESET\]\n-->\[$COLOR_RESET\] "
#else
#    PS1="${debian_chroot:+($debian_chroot)}\u@\h:\w\$(git_branch)$ \t \n-->\[$COLOR_RESET\] "
#fi
#unset color_prompt force_color_prompt

# If this is an xterm set the title to user@host:dir
case "$TERM" in
xterm*|rxvt*)
    PS1="\[\e]0;${debian_chroot:+($debian_chroot)}\u@\h: \w\a\]$PS1"
    ;;
*)
    ;;
esac

# Alias definitions.
if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
  fi
fi


export FZF_DEFAULT_OPTS="--preview 'batcat --color=always {}'"
export FZF_CTRL_T_COMMAND='fdfind . --hidden --exclude ".git"'

export EDITOR=/usr/local/bin/nvim
export SUDO_EDITOR="/usr/local/bin/nvim --clean -S ~/.config/nvim/minimal.vim"

PROMPT_COMMAND="history -a; history -c; history -r; $PROMPT_COMMAND"


#:Tmux stuff {{{
if command -v tmux >/dev/null 2>&1; then
    [ -z "${TMUX}" ] && (tmux attach >/dev/null 2>&1 || tmux)
fi
# }}}

bind 'TAB:menu-complete'
bind "set show-all-if-ambiguous on"
bind "set menu-complete-display-prefix on"

STARSHIP_CONFIG=~/.config/starship.toml
# eval "$(starship init bash)"
eval "$(oh-my-posh init --config ~/.poshthemes/paradox.omp.json bash)"
source ~/.bashutils.sh
