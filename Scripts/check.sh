#Felix Aguilar Ferrer.
#Menu para revisar los ficheros dentro del sistema (utiliza files.txt).

#Obtenemos la libreria del menu.
. ${pathsmta}/Includes/Lib/menu.sh

#Obtenemos la libreria del files.
. ${pathsmta}/Includes/Lib/files.sh

#El bucle se monta para estar en el menu hasta que se decida salir.
menu=0
while [ $menu -eq 0 ]
do

#Se monta el menu, para ver más accede a /Includes/Lib/menu.sh.
title s23
title s40
correct s41 0
error s42 0
yellow s43 0
divider

#Funcion para obtener por pantalla los ficheros. Ubicado en files.sh.
showfiles
divider
options s26 s24 s7
input s16
clear

#Se trata la entrada del usuario.
case $ans in
    1)
    
        #Funcion para buscar ficheros perdidos. Ubicado en files.sh.
        checkfiles
        ;;
    2)
    
        #Funcion para eliminar ficheros perdidos. Ubicado en files.sh.
        deletefiles
        ;;
    3)
    
        #Para salir del menu, inponemos 1 a la variable menu.
        menu=1
        ;;
    *)
        error s19 0
        ;;
esac
done
menu=0