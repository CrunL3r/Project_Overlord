#Felix Aguilar Ferrer.
#Menu de configuración del script.

#Obtiene el path de la instalacion. (variable: instal)
function install(){
    read file < <(find / -name "config.txt" 2> /dev/null)
    read pathsmta < <(grep installdir $file | cut -d ':' -f 2)
    unset file
}

install

menu=0
while [ $menu -eq 0 ]
do
    . ${pathsmta}/Includes/Lib/menu.sh

    title s3
    title s4
    options s12 s13 s2 s15
    input s16
    clear
    case $ans in
        1)
            . ${pathsmta}/Scripts/sort.sh
            ;;
        2)
            ;;
        3)
            . ${pathsmta}/Scripts/config.sh
            ;;
        4)
            menu=1
            ;;
        *)
            error s19 0
            ;;
    esac
done
menu=0