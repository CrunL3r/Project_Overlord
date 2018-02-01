#Felix Aguilar Ferrer
#Libreria para la otención de parametros en ficheros.

#Obtiene el lenguaje del sistema (variable: leng)
function lenguage(){
    read leng < <(grep lenguage /media/sf_Ubuntu/Includes/Data/config.txt | cut -d ':' -f 2)
    leng=/media/sf_Ubuntu/Lenguages/$leng.txt
}

#Obtiene la frase deseada (variable: str) (parametros: campo)
function string(){
    read str < <(grep $1 $leng | cut -d ':' -f 2)
}

#Obtiene el path de la instalacion. (variable: instal)
function install(){
    read file < <(find / -name "config.txt" 2> /dev/null)
    read instal < <(grep installdir $file | cut -d ':' -f 2)
    unset file
}