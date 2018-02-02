#Felix Aguilar Ferrer.
#Menu de configuración del script.

menu=0
while [ $menu -eq 0 ]
do
    . /media/sf_Ubuntu/Includes/Lib/menu.sh

    title mt3
    title ds1
    options o31 o32 mt2 o25
    input in1
    clear
    case $ans in
        1)
            ;;
        2)
            ;;
        3)
            . /media/sf_Ubuntu/Scripts/config.sh
            ;;
        4)
            menu=1
            ;;
        *)
            error er2
            ;;
    esac
done
menu=0