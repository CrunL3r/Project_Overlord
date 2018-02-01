. /media/sf_Ubuntu/Includes/Lib/menu.sh
. /media/sf_Ubuntu/Includes/Lib/control.sh

function chlenguage(){
    
    read chlen < <(grep lenguage /media/sf_Ubuntu/Includes/Data/config.txt | cut -d ':' -f 2)
    
    if [ "$chlen" = "$1" ]
        then
            error er1
        else
            sed -i "s/:$chlen:/:$1:/g" /media/sf_Ubuntu/Includes/Data/config.txt
            error so1
        fi 
    unset chlen
}

lenguage

text mt1
options o11 o12 o13
end in1

case $ans in
    1)
        chlenguage esp
        ;;
    2)
        chlenguage eng
        ;;
    3)
        exit
        ;;
    *)
        error er2
        ;;
esac
