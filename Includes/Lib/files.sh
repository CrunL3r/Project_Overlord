#Felix Aguilar Ferrer.
#Funciones para interactuar con los archivos ordenados.

function showfiles(){
    #Felix Aguilar Ferrer.
    #Muestra por pantalla los archivos con el color correpondiente a la leyenda.
    #Inputs Ninguno.

    #Se genera un array con el contenido del archivo files.txt.
    readarray a < ${pathsmta}/Includes/Data/files.txt
    
    #Se obtiene el directorio de la papelera.
    configs bin bins
    
    #Se obtiene la longitud total del array  y se crea un indice.
    int=${#a[@]}
    i=0
    
    #En el bucle se tratará cada archivo.
    while [ $i -lt $int ]
    do
        #Se obtiene el path y el nombre del archivo correspondiente.
        read paths < <(echo ${a[$i]} | cut  -d':' -f 2)
        read names < <(echo ${a[$i]} | cut  -d':' -f 1)
        
        #Si es el mismo path que el de la papelera lo mostrara de color amarillo.
        if [ "$bins" = "$paths" ]
        then
            yellow $paths$names 1
        else
        
            #Si existe en la ubicación de files.txt se mostrara de color verde, de
            #lo contrario se mostrara de color rojo.
            if [ -f $paths$names ]
            then
                correct $paths$names 1
            else
                error $paths$names 1
            fi
        fi
        
        #Se le añade 1 al indice.
        let i=$i+1
    done
    
    #Se eliminan las variables que nos son utilizadas.
    unset paths
    unset names
    unset i
    unset a
    unset int
    unset bin
}

function deletefiles(){
    #Felix Aguilar Ferrer.
    #Se eliminan los ficheros que no estan en la localizacion a la que
    #apunta el path dentro de files.txt.
    #Inputs Ninguno.

    #Se genera un array con el contenido del archivo files.txt.
    readarray a < ${pathsmta}/Includes/Data/files.txt
    
    #Se obtiene la longitud total del array  y se crea un indice.
    int=${#a[@]}
    i=0
    
    #Se genera una variable para comprobar la función.
    res=0
    
    #En el bucle se tratará cada archivo.
    while [ $i -lt $int ]
    do
    
        #Se obtiene el path y el nombre del archivo correspondiente.
        read paths < <(echo ${a[$i]} | cut  -d':' -f 2)
        read names < <(echo ${a[$i]} | cut  -d':' -f 1)
        
        #Si no existe, se borra la entrada del archivo files.txt.
        if [ ! -f $paths$names ]
        then
            grep -v "$names" ${pathsmta}/Includes/Data/files.txt > temp && mv temp ${pathsmta}/Includes/Data/files.txt
            res=1
        fi
        
        #Se incrementa el indice.
        let i=$i+1
    done
    
    #Se muestra el mensaje dependiendo del resultado de la operacion.
    if [ $res -eq 1 ]
    then
        correct s25 0
    else
        error s27 0
    fi
    
    #Se borran las variables que no se neesitan.
    unset a
    unset paths
    unset names
    unset res
    unset i
    unset int
}

function checkfiles(){
    #Felix Aguilar Ferrer.
    #Se recuperan si estan los archivos perdidos desde la carpeta de incorporar
    #archivos al script.
    #Inputs Ninguno.

    #Se genera un array con el contenido del archivo files.txt.
    readarray a < ${pathsmta}/Includes/Data/files.txt
    
    #Se obtiene el valor de la carpeta por donde se introducen los archivos al sistema.
    configs new news
    
    #Se obtiene la longitud total del array  y se crea un indice.
    int=${#a[@]}
    i=0
    
    #Se genera una variable para comprobar la función.
    res=0
    
    #En el bucle se tratará cada archivo.
    while [ $i -lt $int ]
    do
    
        #Se obtiene el path y el nombre del archivo correspondiente.
        read paths < <(echo ${a[$i]} | cut  -d':' -f 2)
        read names < <(echo ${a[$i]} | cut  -d':' -f 1)
        
        #Si existe el archivo en la carpeta de input, se moverá.
        if [ -f $news/$names ]
        then
            mv $news/$names $paths
            res=1
        fi
        
        #Se incrementa el indice.
        let i=$i+1
    done
    
    #Se muestra el mensaje dependiendo del resultado de la operacion.
    if [ $res -eq 1 ]
    then
        correct s25 0
    else
        error s27 0
    fi
    
    #Se borran las variables que no se neesitan.
    unset news
    unset a
    unset i
    unset res
    unset paths
    unset names
    unset int
}