# cd related aliases
alias ..="cd .."
alias ...="cd ../.."
alias ....="cd ../../.."

# ls aliases
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'

alias tree="tree --dirsfirst -F"

alias mkdir="mkdir -p -v"
# git aliases
alias gtst="git status -sb"
alias gtlg="git log --oneline"
alias gtrv="git remote -v"

# Utility aliases
alias rgh="rg --hidden"
alias fd="fdfind"

# Neovim aliases
alias nn="nvim +Telescope"

# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    #alias dir='dir --color=auto'
    #alias vdir='vdir --color=auto'

    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

mkvenv() {
    python3 -m venv ~/.venv/"$1"
}
