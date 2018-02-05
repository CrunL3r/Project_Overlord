#Felix Aguilar Ferrer.
#Libreria para la creacion de menus.

. ${pathsmta}/Includes/Lib/control.sh

configs lenguage leng
leng=${pathsmta}/Lenguages/$leng.txt

function title (){
    string $1
    echo - $str
    unset str
    echo -------------------------------------------------
}

function options (){
    n=1
    i=$#
    while [ $n -le $i ]
    do
        string $1
        echo -$n $str
        shift
        let n=n+1
    done
    unset n
    unset str
    unset i
    echo -------------------------------------------------
}

function input(){
    string $1
    echo -n $str
    unset str
    read ans
}

function correct(){
    if [ $2 -eq 1 ]
    then
        str=$1
    else
        string $1
    fi
    echo -e "\e[42m$str\e[49m"
    unset str
}

function error(){
    if [ $2 -eq 1 ]
    then
        str=$1
    else
        string $1
    fi
    echo -e "\e[41m$str\e[49m"
    unset str
}

function text(){
    string $1
    echo $str
    unset str
}

function output(){
    if [ ! -z $2 ]
    then
        string $2
        echo -e "\e[44m$str = $1\e[49m"
        else
        echo -e "\e[44m$1\e[49m"
    fi
    unset str  
}

function divider(){
    echo -------------------------------------------------
}