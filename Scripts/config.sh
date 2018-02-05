#Felix Aguilar Ferrer.
#Menu de configuración del script.

menu=0
while [ $menu -eq 0 ]
do
    . ${pathsmta}/Includes/Lib/menu.sh
    .  ${pathsmta}/Includes/Lib/chdir.sh
    
    title s2
    options s8 s9 s10 s38 s11 s7
    input s16
    clear
    case $ans in
        1)
            . ${pathsmta}/Scripts/change.sh
            ;;
        2)
            chdir directory s9
            ;;
        3)
            chdir bin s10
            ;;
        4)
            chdir new s38
            ;;
        5)
            ;;
        6)
            menu=1
            ;;
        *)
            error s19
            ;;
    esac
done
menu=0