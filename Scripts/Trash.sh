# Creador por Anderson valencia castaño
#archivos borrados sin modificacion en 20 dias
. ${pathsmta}/includes/Lib/control.sh
configs bin MvTrash

#Detectar el home del usuario
Userhome=$(pwd)
#Crear en el usuario la carpeta con los archivos
mkdir -m 777 $Userhome/Escritorio/Archivos
DirArch=$Userhome/Escritorio/Archivos

echo -n "Quieres crear la ruta de la papelera?"
echo -n "introduce 1 para si"
echo -n "introduce 2 para no"
read seleccion1

if ($seleccion1 == 1){
	echo -n "introduce la ruta de la papelera"
	read papelera1
	find $DirArch -maxdepth 1 -atime +20 -type f -exec mv "{}" $papelera1
}
then

  echo 'No file deleted'

else

  echo 'deleted files'

fi


if ($seleccion1 == 2){
	mkdir -m 777 $Userhome/Escritorio/Papelera
	DirTrash=$Userhome/Escritorio/Papelera
	find $DirArch -maxdepth 1 -atime +20 -type f -exec mv "{}" $DirTrash
}
then

  echo 'No file deleted'

else

  echo 'deleted files'

fi
