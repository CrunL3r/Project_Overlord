#Felix Aguilar Ferrer.
#Libreria con el menu para cambiar de directorios para el funcionamiento del script.

function inputch(){
    #Felix Aguilar Ferrer.
    #Menu para cambiar el directorio donde se ordenan los archivos.
    #Inputs $1 = Para realizar el mover todos los archivos al nuevo directorio. [0 / 1]
    
    #Se pide el nuevo path del directorio y nombre.
    divider
    unset ans
    input s39
                
    #Se ejecuta la función para cambiar directorio dependiendo de la entrada.
    changedir $ans $olddir $1
}

function chdir(){
    #Felix Aguilar Ferrer.
    #Menu para cambiar el directorio donde se ordenan los archivos.
    #Inputs $1 = Que directorio se cambia de nombre, este tiene que estar en el archivo config.txt.
    #       $2 = Frase para el Titulo.
    
    menu=0
    while [ $menu -eq 0 ]
    do
    
        #Obtenemos la libreria del menu.
        . ${pathsmta}/Includes/Lib/menu.sh

        #Obtenemos la libreria de control.
        . ${pathsmta}/Includes/Lib/control.sh
    
        #Se obtiene el valor del directorio a cambiar.
        configs $1 olddir
        
        #Se monta el menu, para ver más accede a /Includes/Lib/menu.sh.
        title $2
        output $olddir s28
        divider
        options s29 s30 s7
        input s16
        clear
        
        #Se trata la entrada del usuario.
        case $ans in
            1)
                inputch 0
                ;;
            2)
                inputch 1
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
}