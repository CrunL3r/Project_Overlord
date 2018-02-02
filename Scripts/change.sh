#Felix Aguilar Ferrer.
#Cambio de idioma.

menu=0
while [ $menu -eq 0 ]
do
    
    . /media/sf_Ubuntu/Includes/Lib/menu.sh
    
    function chlenguage(){
    
        read chlen < <(grep lenguage /media/sf_Ubuntu/Includes/Data/config.txt | cut -d ':' -f 2)
    
        if [ "$chlen" = "$1" ]
            then
                error er1
            else
                sed -i "s/:$chlen:/:$1:/g" /media/sf_Ubuntu/Includes/Data/config.txt
                correct so1
            fi 
        unset chlen
        }


    title mt1
    options o11 o12 o13
    input in1
    clear
    case $ans in
        1)
            chlenguage esp
            ;;
        2)
            chlenguage eng
            ;;
        3)
            menu=1
            ;;
        *)
            error er2
            ;;
    esac
done
menu=0