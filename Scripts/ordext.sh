# Creador por Andreu LLabres Bañuls
. ${pathsmta}/Includes/Data/arcp.txt
function ordext(){
if [[ ! -d /sk/ ]]; then
	mkdir sk
	# Directorio action sería donde se produce todo
	# Recoge las extensiones de los archivos
    ls -p action/ | grep -v / | sort > sk/arcp.txt
	if [ -s sk/arcp.txt ];then
    
        ls -p action/*.* | cut -d . -f 2 | sort | uniq > sk/ext.txt
        # Recoge los nombres de los archivos con su extensión
        ls -p action/*.* | cut -d / -f 2 | sort > sk/arc.txt
        
        for i in `cat sk/ext.txt`
        do	
            count=0		
            mkdir action/$i
            for x in `cat sk/arc.txt`
            do  
                if [[ "$x" = *.$i ]]; then
                    # Cambiar el nombre si es igual que el del directorio.
                    if [[ "$x" = $i.* ]]; then				
                        mv action/$x action/$i/$count-archive.$i
                    else
                        let count=count-1
                        mv action/$x action/$i/$x				
                    fi
                fi
                let count=count+1
            done 
        done
        #Ver si quedan archivos existentes que no tengan extensión
        ls -p action/ | grep -v / |sort > sk/arcsext.txt

        if [ -f sk/arcsext.txt ]; then
            pathu=action/unknown		
            mkdir $pathu
            for z in `cat sk/arcsext.txt`	
            do
                mv action/$z $pathu/$z
            done
        fi
        # rm -r sk
        unset count
        unset pathu
    else
        echo No has introducido ningun archivo para agrupar por ext.
    fi
fi
}
ordext
