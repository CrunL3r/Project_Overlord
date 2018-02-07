#Felix Aguilar Ferrer.
#Libreria para la obtención de parametros en ficheros.

function configs(){
    #Felix Aguilar Ferrer.
    #Recoje un campo del archivo config.txt y lo guarda en la variable deseada.
    #Inputs $1 = Campo del archivo.
    #       $2 = Variable donde se guarda.
    
    read $2 < <(grep $1 ${pathsmta}/Includes/Data/config.txt | cut -d ':' -f 2)
}

function string(){
    #Felix Aguilar Ferrer.
    #Recoje el string del archivo de lenguaje indicado y lo guarda en la variable str.
    #Inputs $1 = String a buscar.
    read str < <(grep $1 $leng | cut -d ':' -f 2)
}

function changedir(){
    #Felix Aguilar Ferrer.
    #Cambia el directorio especifiado que este dentro de config.txt.
    #Inputs $1 = Nuevo directorio.
    #       $2 = Directorio viejo.
    #       $3 = Se mueven los archivos? 0 o 1.
    
    #Se realizan comprobaciones para evitar errores por parte del usuario.
    if [ ! "$1" = "" ]
    then 
        if [ ! $1 = $2 ]
        then
            if [ ! -d $1 ]
            then
                
                #Si se puede crear el directorio, entonces se cambia en el archivo config.txt.
                mkdir $1
                if [ $? = 0 ]
                then
                    sed -i "s|:$2:|:$1:|g" ${pathsmta}/Includes/Data/config.txt
                    correct s37 0
                    
                    #Si se han de mover los archivos, se realiza un cp de todos los archivos y 
                    #directorios que contiene el directorio anterior.
                    if [ $3 -eq 1 ]
                    then
                        cp -r $2* $1
                        
                        #Si ha sido un exito, se pasa a procesar la base de datos de archivos.
                        if [ $? = 0 ]
                        then
                            #Se elimina la carpeta anterior.
                            rm -r $2
                            #Funcion de procesado de archivos.
                            ffile $1
                            correct s36 0
                        else
                            error s35 0
                        fi
                    fi
                else
                    error s34 0
                fi
            else
                error s33 0
            fi
        else
            error s32 0
        fi
    else
        error s31 0
    fi
}

function ffile(){
    #Felix Aguilar Ferrer.
    #Cambia el path de los archivos que esten en la base de datos.
    #Inputs $1 = directorio.
    
    #Se genera un array con todos los valores de files.txt.
    readarray a < ${pathsmta}/Includes/Data/files.txt
    
    #Se crea un index y la longitud del array.
    i=0
    int=${#a[@]}
    
    #Se van a procesar todas las entradas del array.
    while [ $i -lt $int ]
    do
        #Se lee el nombre del archivo y se busca por el sistema sabiendo aproximadamente 
        #la ruta donde se encuentra ($1) y recortando el nombre.
        read name < <(echo ${a[$i]} | cut  -d':' -f 1)
        read where < <(find $1 -name "$name" 2> /dev/null | rev | cut -d'/' -f2- | rev)
        
        #Si ha sido exitosa la busqueda, se realiza lo siguiente.
        if [ $? = 0 ]
        then
        
            #Se recupera su antiguo path.
            read old < <(echo ${a[$i]} | cut  -d':' -f 2)
            
            #Se sustituye el path antiguo con el nuevo.
            sed -i "s|:$old:|:$where/:|g" ${pathsmta}/Includes/Data/files.txt 
        fi
        
        #Se suma uno al indice y se eliminan las variables.
        let i=$i+1
        unset where
        unset old
        unset name
    done
    
    #Se eliminan las variables que no se utilizan.
    unset a
    unset int
    unset i
}

function changeord(){
    #Para cambiar la forma de ordenar con otro metodo
    echo #Working...
    
}

function addline(){
    #Felix Aguilar Ferrer.
    #Permite la inserción de lineas con el caracter divisor :.
    #Inputs $1 = Fichero destino.
    #       $2 $3 $4 ... = Campos a insertar.
    
    #Obtenemos el path y movemos el puntero.
    pathfile=$1
    shift
    
    #Se crea el indice y el numero de parametros introducidos se obtiene
    #ademas de crear el inicio del string.
    i=$#
    n=1
    txt=""
    
    #El bucle para añadir campos.
    while [ $n -le $i ]
    do
    txt="$txt$1:"
    shift
    let n=$n+1
    done
    
    #Se introduce la linea al archivo.
    echo -e $txt 1>> $pathfile
}
