#Felix Aguilar Ferrer.
#Menu del gestor de archivos


menu=0
while [ $menu -eq 0 ]
do
    . ${pathsmta}/Includes/Lib/menu.sh
    
    title s12
    configs directory direc
    output  $direc s21
    configs orderby order
    output $order s22
    divider
    options s20 s23 s15
    input s16
    
    clear
    case $ans in
        1)
            
            ;;
        2)
            . ${pathsmta}/Scripts/check.sh
            ;;
        3)
            menu=1
            ;;
        *)
            error s19
            ;;
    esac
    
done
menu=0