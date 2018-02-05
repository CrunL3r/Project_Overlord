#Felix Aguilar Ferrer
#Funciones para interactuar con los archivos ordenados.

function showfiles(){

    readarray a < ${pathsmta}/Includes/Data/files.txt
    
    int=${#a[@]}
    i=0
    while [ $i -lt $int ]
    do
        read paths < <(echo ${a[$i]} | cut  -d':' -f 2)
        read names < <(echo ${a[$i]} | cut  -d':' -f 1)
        if [ -f $paths$names ]
        then
            correct $paths$names 1
        else
            error $paths$names 1
        fi
        let i=$i+1
    done
    unset paths
    unset names
    unset i
    unset int
}

function deletefiles(){
    
    int=${#a[@]}
    i=0
    while [ $i -lt $int ]
    do
        read paths < <(echo ${a[$i]} | cut  -d':' -f 2)
        read names < <(echo ${a[$i]} | cut  -d':' -f 1)
        if [ ! -f $paths$names ]
        then
            grep -v "$names" ${pathsmta}/Includes/Data/files.txt > temp && mv temp ${pathsmta}/Includes/Data/files.txt
            res=1
            else
            res=0
        fi
        let i=$i+1
    done
    if [ $res -eq 1 ]
    then
        correct s25 0
    else
        error s27 0
    fi
    unset paths
    unset names
    unset res
    unset i
    unset int
}

function checkfiles(){
    int=${#a[@]}
    i=0
    while [ $i -lt $int ]
    do
        read paths < <(echo ${a[$i]} | cut  -d':' -f 2)
        read names < <(echo ${a[$i]} | cut  -d':' -f 1)
        
        if [ -f ${pathsmta}/new/$names ]
        then
            mv ${pathsmta}/new/$names $paths
            res=1
            else
            res=0
        fi
        let i=$i+1
    done
    if [ $res -eq 1 ]
    then
        correct s25 0
    else
        error s27 0
    fi
    unset i
    unset res
    unset paths
    unset names
    unset int
}
