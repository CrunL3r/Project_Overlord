# Creado por Andreu Llabres Bañuls
# . ${pathsmta}/Includes/Lib/control.sh
function countp {     
    ls -p action/*.* | cut -d / -f 2 | sort > sk/br.txt  
    countt=$(cat sk/br.txt | wc -l) #Contar las lineas del archivo.
    a=1
    for x in `cat sk/br.txt`
    do
        i=1
        num=0
        #var=$(echo $x | wc -m) # No funciona
        var=$(expr length $x) # Funciona
        while [ $i -le $var ]; do
            if [ `expr substr $x $i 1` = "." ]; then 
               let num=num+1
             fi
             i=`expr $i + 1`
        done  
        if [ $a -le $countt ]; then
            let num=num+1
            cat sk/br.txt | head -$a | tail -1 | cut -d . -f $num  >> sk/ext0.txt
            let a=a+1
        fi   
    done
    cat sk/ext0.txt | uniq >> ext
}

function rml {
    # rm -r sk
    # unset count
    # unset countt
    # unset pathu
    unset num
    unset i
    unset a
    
}

function ordext(){
if [[ ! -d /sk/ ]]; then
    # Directorio sk es donde se almacena toda las bases de datos que se maneja en la busqueda de archivos.
	mkdir sk
	# Directorio action sería donde se produce toda acción.
	# Comprueba si existen archivos.
    ls -p action/ | grep -v / | sort > sk/arcp.txt
    # Si el archivo arcp.txt no esta vacio.
	if [ -s sk/arcp.txt ]; then
        # Recoge las extensiones de los archivos.
        countp
        # Recoge los nombres de los archivos con su extensión.
        ls -p action/*.* | cut -d / -f 2 | sort > sk/arc.txt
        # For para mostrar las extensiones de los archivos.
        for i in `cat sk/ext.txt`
        do	
            count=0
            #Genera los directorios dependiendo de la extensión.		
            mkdir action/$i
            #For para mostrar el nombre del archivo con su extensión
            for x in `cat sk/arc.txt`
            do  
                #Si el archivo acaba en .extensión
                if [[ "$x" = *.$i ]]; then
                    # Cambiar el nombre si es igual que el del directorio en el que se mueve.
                    if [[ "$x" = $i.* ]]; then				
                        mv action/$x action/$i/$count-archive.$i
                        let count=count+1
                    else
                        mv action/$x action/$i/$x
                        let count=count-1				
                    fi
                fi
            done 
        done
        #Ver si quedan archivos existentes que no tengan extensión.
        ls -p action/ | grep -v / |sort > sk/arcsext.txt
        #Si el archivo arcsext existe y es corriente.
        if [ -f sk/arcsext.txt ]; then
            pathu=action/unknown		
            mkdir $pathu
            for z in `cat sk/arcsext.txt`	
            do
                mv action/$z $pathu/$z
            done
        fi
        # Se borra la base de datos.
        rml
    else
        echo No has introducido ningun archivo para agrupar por ext.
    fi
fi
}
ordext