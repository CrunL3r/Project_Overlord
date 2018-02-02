#Felix Aguilar Ferrer.
#Libreria para la creacion de menus.

. /media/sf_Ubuntu/Includes/Lib/control.sh

lenguage

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
    string $1
    echo -e "\e[42m$str\e[49m"
    unset str
}

function error(){
    string $1
    echo -e "\e[41m$str\e[49m"
    unset str
}

function text(){
    string $1
    echo $str
    unset str
}