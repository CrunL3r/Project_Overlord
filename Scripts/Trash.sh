# Creador por Anderson valencia castaño
#archivos borrados sin modificacion en 20 dias

#Librerias
. ${pathsmta}/includes/Lib/control.sh
#Ubicacion papelera
configs bin MvTrash
#Ubicacion directorio usuario
configs directory UserDir

#Crear en el usuario la carpeta con los archivos




if (-d $MvTrash ){
	find $UserDir -maxdepth 1 -atime +20 -type f -exec mv "{}" $MvTrash
}
then

  echo 'No file deleted'

else

  echo 'deleted files'

fi


if (! -d $MvTrash){
	echo 'The trash dont exist'
	echo 'Select where you want the trash'
	read Newtrash
	mkdir -m 777 $Newtrash
	find $UserDir -maxdepth 1 -atime +20 -type f -exec mv "{}" $Newtrash
}
then

  echo 'No file deleted'

else

  echo 'deleted files'

fi
