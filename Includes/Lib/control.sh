#Felix Aguilar Ferrer
#Libreria para la otención de parametros en ficheros.

#Obtiene el lenguaje del sistema (variable: leng)
function configs(){
    read $2 < <(grep $1 ${pathsmta}/Includes/Data/config.txt | cut -d ':' -f 2)
}

#Obtiene la frase deseada (variable: str) (parametros: campo)
function string(){
    read str < <(grep $1 $leng | cut -d ':' -f 2)
}

#Cambia el directorio de ordenación.
function changedir(){
    if [ ! -z "$1" ]
    then 
        if [ ! $1 = $2 ]
        then
            if [ ! -d $1 ]
            then
                mkdir $1
                if [ $? = 0 ]
                then
                    sed -i "s|:$2:|:$1:|g" ${pathsmta}/Includes/Data/config.txt
                    correct s37 0
                    if [ $3 -eq 1 ]
                    then
                        cp -r $2* $1
                        if [ $? = 0 ]
                        then
                            rm -r $2
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

#Inpone el path en los archivos.
function ffile(){
    
    readarray a < ${pathsmta}/Includes/Data/files.txt
    read file < <(grep $1 ${pathsmta}/Includes/Data/config.txt | cut -d ':' -f 2)
    i=0
    int=${#a[@]}
    
    while [ $i -lt $int ]
    do
        read name < <(echo ${a[$i]} | cut  -d':' -f 1)
        read where < <(find $file -name "$name" 2> /dev/null | rev | cut -d'/' -f2- | rev)
        if [ $? = 0 ]
        then
            read old < <(echo ${a[$i]} | cut  -d':' -f 2)
            sed -i "s|:$old:|:$where/:|g" ${pathsmta}/Includes/Data/files.txt 
        fi
        let i=$i+1
        unset where
        unset old
        unset name
    done
    unset file
    unset a
    unset int
    unset i
}