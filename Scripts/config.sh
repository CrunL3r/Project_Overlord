#Felix Aguilar Ferrer.
#Menu de configuración del script.

menu=0
while [ $menu -eq 0 ]
do
    . /media/sf_Ubuntu/Includes/Lib/menu.sh

    title mt2
    options o21 o22 o23 o24 o13
    input in1
    clear
    case $ans in
        1)
            . /media/sf_Ubuntu/Scripts/change.sh
            ;;
        2)
            ;;
        3)
            ;;
        4)
            ;;
        5)
            menu=1
            ;;
        *)
            error er2
            ;;
    esac
done
menu=0