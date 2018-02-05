
# Creador por Andreu LLabres Bañuls

function ordext(){
if [[ ! -d /sk/ ]]; then
	mkdir sk
	# action sería donde se produce todo
	ls -p action/ | grep -v / | cut -d . -f 2 | sort | uniq > sk/ext.txt
	ls -p action/ | grep -v / | sort > sk/arc.txt
	#Hacer un for anidado para sacar las extensiones 
	#y después mover los archivos dependiendo de esa extension.
	for i in `cat sk/ext.txt`
	do
		count=0		
		mkdir action/$i
		for x in `cat sk/arc.txt`
		do  
			if [[ "$x" = *.$i ]]; then
				# Cambiar el nombre si es igual que el del directorio .
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
	#Eliminar los archivos utilizados
	rm -R sk
	unset count
fi
}
ordext 