# Creador por Anderson valencia castaño
#archivos borrados sin modificacion en 20 dias

#Librerias
. ${pathsmta}/includes/Lib/control.sh

#Ubicacion papelera
configs bin MvTrash

#Ubicacion directorio usuario
configs directory UserDir

############################################################################################################################################
#Notas de comandos
############################################################################################################################################
#
#opcion find -mtime : es para comprobar la ultima modificacion en n dias
#opcion find -atime : es para comprobar el ultimo acceso en n dias

#Find -mtime o -atime n: 
#		+n es para buscar resultados mayores que n
#		-n es para buscar resultados menores que n
#		n es para buscar resultados que son exactamente n

#ejemplo de n:   +20 seria apartir del dia 21 a x dias, -20 seria apartir del dia 19 a 1 y 20 seria los del dia 20
#-------------------------------------------------------------------------------------------------------------------------------------------
#
#-exec : comando que sirve para que se ejecute el mv si los archivos se pueden mover


############################################################################################################################################


#Comprobamos que elusuario tiene la papelera creada, de no estar creada la carpeta le preguntamos donde quiere que este la papelera
if [ ! -d $MvTrash ];
then
      #Como no esta la papelera informamos al usuario que no se encontro la papelera
	echo 'The trash dont exist'

      #Pedimos al usuario la ubicacion de la papelera pero esta siempre tendra el nombre de " Trash "
	echo 'Select where you want the trash'
	
      #Guardamos en la variable Newtrash la papelera y añadimos el nombre Trash para que siempre sea la misma
	read Newtrash/Trash
      
      #Cambiamos los  permisos de la papelera: Usuario; lectura, escritura y ejecucion "7", Grupo; lectura y escritura "6", Otros; lectura "4".
	mkdir -m 764 $Newtrash

      #Comando para buscar los archivos y mobverlos a la papelera
	find $UserDir -atime +20 -type f -exec mv "{}" $Newtrash

      #informamos al usuario que el archivo fue borrado
	echo 'deleted files'

else

      #En caso en que el archivo fue borrado
  	echo 'No file deleted'

fi



#Comprobamos que el usuario tiene la carpeta, al estar la carpeta ejecutamos el codigo..
if [ -d $MvTrash ];
then

      #al estar la papelera buscamos con find los archivos que tengan mas de 20 dias sin acceso y los mueve en la papelera
	find $UserDir -atime +20 -type f -exec mv "{}" $MvTrash

      #Mensaje que saldra si los archivos se enviaron a la papelera
	echo 'deleted files'

else
      #Mensaje que saldra si los archivos no se enviaron a la papelera
  	echo 'No file deleted'

fi





