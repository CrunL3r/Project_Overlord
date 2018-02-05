#Felix Aguilar Ferrer.
#Cambio de idioma.

menu=0
while [ $menu -eq 0 ]
do
    
    . ${pathsmta}/Includes/Lib/menu.sh
    
    function chlenguage(){
    
        configs lenguage chlen
    
        if [ "$chlen" = "$1" ]
            then
                error s18 0
            else
                sed -i "s/:$chlen:/:$1:/g" ${pathsmta}/Includes/Data/config.txt
                correct s17 0
            fi 
        unset chlen
        }


    title s1
    options s5 s6 s7
    input s16
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
            error s19 0
            ;;
    esac
done
menu=0