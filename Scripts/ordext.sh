# Creador por Andreu LLabres Bañuls

function ordext(){
if [[ ! -d /sk/ ]]; then
	mkdir sk
	# Directorio action sería donde se produce todo
	# Recoge las extensiones de los archivos
	ls -p action/*.* | cut -d . -f 2 | sort | uniq > sk/ext.txt
	# Recoge los nombres de los archivos con su extensión
	ls -p action/*.* | cut -d / -f 2 |sort > sk/arc.txt
	#Hacer un for anidado para sacar las extensiones 
	#y después mover los archivos dependiendo de esa extension.
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
	# ESTA EN OBRAS!!!
	# ===========================================
	if [[ -f sk/arcext.txt ]]; then
		pathu=action/unknown		
		mkdir $pathu
		for z in `cat sk/arcext.txt`	
		do
			mv action/$z $pathu/$z
		done
	fi
	# ============================================
	rm -r sk
	unset count
	unset pathu
fi
}
ordext
