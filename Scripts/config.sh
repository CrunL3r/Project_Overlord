#Felix Aguilar Ferrer.
#Menu para la configuración del script.

#Obtenemos la libreria del menu.
. ${pathsmta}/Includes/Lib/menu.sh

#Obtenemos la libreria de chdir.
.  ${pathsmta}/Includes/Lib/chdir.sh

#El bucle se monta para estar en el menu hasta que se decida salir.
menu=0
while [ $menu -eq 0 ]
do
    
    #Se monta el menu, para ver más accede a /Includes/Lib/menu.sh.
    title s2
    options s8 s9 s10 s38 s11 s7
    input s16
    clear
    
    #Se trata la entrada del usuario.
    case $ans in
        1)
            
            #Accedemos al menu de cambio de idioma.
            . ${pathsmta}/Scripts/change.sh
            ;;
        2)
            #Accedemos al menu de cambio de diretorio.
            chdir directory s9
            ;;
        3)
            #Accedemos al menu de cambio de diretorio.
            chdir bin s10
            ;;
        4)
            #Accedemos al menu de cambio de diretorio.
            chdir new s38
            ;;
        5)
            #En construcción.
            ;;
        6)
            #Para salir del menu, inponemos 1 a la variable menu.
            menu=1
            ;;
        *)
            error s19 0
            ;;
    esac
done
menu=0