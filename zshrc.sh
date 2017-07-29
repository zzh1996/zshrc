export TERM="xterm-256color"
ZSH_THEME="ys"
plugins=(git colored-man-pages extract colorize cp dircycle pip github gitignore zsh-autosuggestions zsh-completions zsh-syntax-highlighting )
setopt histignorespace # command starts with space doesn't appear in history
export EDITOR=vim

alias gcc="gcc -Wall -g"
alias g++="g++ -Wall -g -std=c++11"
alias clang="clang -Wall -g"
alias clang++="clang++ -Wall -g -std=c++11"

open_in_gui(){
    xdg-open "$1" &> /dev/null
}

alias e="open_in_gui"
alias v="vim"
alias s="subl" # sublime
alias p="python3"
alias p2="python"
alias i="ipython3"
alias i2="ipython"
alias a="du -a -d 1 -h --time | sort -h"

compile_c(){
    fn="$1"
    if [[ $fn != *.c ]]
    then
        fn="$fn.c"
    fi
    clang "$fn" -o "`basename $1 .c`" ${@:2}
}
alias c="compile_c"

compile_c_run(){
    if c $*
    then 
        echo
        time "./`basename $1 .c`"
    fi
}
alias cr="compile_c_run"

grep_r(){
    grep "$*" . -R 
}

alias f="grep_r"
alias myip="curl ip.cn;curl myip.ustclug.org"

ipip_query(){
    curl http://freeapi.ipip.net/$1
}

alias ipip="ipip_query"
alias digs="dig +short"

alias sau="sudo apt update"
alias sai="sudo apt install"
alias saf="sudo apt full-upgrade"
