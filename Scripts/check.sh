#Felix Aguilar Ferrer
#Revisa que los archivos ordenados esten en la carpeta que corresponde

. ${pathsmta}/Includes/Lib/menu.sh
. ${pathsmta}/Includes/Lib/files.sh

menu=0
while [ $menu -eq 0 ]
do
title s23
showfiles
divider
options s26 s24 s7
input s16
clear
case $ans in
    1)
        checkfiles
        ;;
    2)
        deletefiles
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