export TERM="xterm-256color"
ZSH_THEME="ys"
plugins=(
    git
    colored-man-pages
    extract
    colorize
    cp
    dircycle
    pip
    github
    gitignore
    docker
    zsh-autosuggestions
    zsh-completions
    zsh-syntax-highlighting
    history-substring-search
)
setopt histignorespace # command starts with space doesn't appear in history
export EDITOR=vim

alias gcc="gcc -Wall -g"
alias g++="g++ -Wall -g -std=c++11"
alias clang="clang -Wall -g"
alias clang++="clang++ -Wall -g -std=c++11"

open_in_gui(){
    if [[ `uname` == 'Linux' ]]; then
        xdg-open "$1" &> /dev/null
    elif [[ `uname` == 'Darwin' ]]; then
        open "$1"
    fi
}

alias e="open_in_gui"
alias v="vim"
alias s="subl" # sublime
alias p="python3"
alias p2="python2"
alias i="ipython3"
alias i2="ipython2"
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
    grep -R -i -n -I --color=always --exclude-dir=.git "$*" .
}

alias f="grep_r"
alias myip="curl https://ip.cn; curl https://myip.ustclug.org"

ipip_query(){
    curl http://freeapi.ipip.net/$1
}

alias ipip="ipip_query"
alias digs="dig +short"

alias sau="sudo apt update"
alias sai="sudo apt install"
alias saf="sudo apt full-upgrade"

alias inprivate='fc -p /dev/null; PS1="${PS1:0:1}PRIVATE ${PS1:1}"'

alias diff="git diff --no-index"
