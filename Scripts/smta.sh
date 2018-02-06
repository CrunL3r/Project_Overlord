#Felix Aguilar Ferrer.
#Menu de principal de la herramienta, primera hoja de ejecución.

#Obtiene el path de la instalacion buscando el fichero de configuracion (config.txt).
echo "Searching for instalation ..."

#Buscamos el fichero config.txt y guardamos la ruta en la variable file.
read file < <(find / -name "config.txt" 2> /dev/null)

#Accedemos al fichero y buscamos el directorio de instalación.
# Este se guarda en y lo guardamos en la variable pathsmta.
read pathsmta < <(grep installdir $file | cut -d ':' -f 2)

#Se eliminan las variables que ya no se necesitan.
unset file
clear

#Obtenemos la libreria del menu.
. ${pathsmta}/Includes/Lib/menu.sh
    
#El bucle se monta para estar en el menu hasta que se decida salir.
menu=0
while [ $menu -eq 0 ]
do

    #Se monta el menu, para ver más accede a /Includes/Lib/menu.sh.
    title s3
    title s4
    options s12 s13 s2 s15
    input s16
    clear
    
    #Se trata la entrada del usuario.
    case $ans in
        1)
        
            #Se envia al usuario al menu de ordenacion.
            . ${pathsmta}/Scripts/sort.sh
            ;;
        2)
            #Working...
            ;;
        3)
            #Se envia al usuario al menu de configuración.
            . ${pathsmta}/Scripts/config.sh
            ;;
        4)
            #Para salir del script.
            menu=1
            ;;
        *)
            error s19 0
            ;;
    esac
done
unset menu