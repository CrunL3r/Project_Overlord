#Felix Aguilar
#Menu para cambiar el directorio donde se ordenan los archivos.

function chdir(){
    menu=0
    while [ $menu -eq 0 ]
    do
    
        . ${pathsmta}/Includes/Lib/menu.sh
        . ${pathsmta}/Includes/Lib/control.sh
    
        configs $1 olddir
        
        title $2
        output $olddir s28
        divider
        options s29 s30 s7
        input s16
        clear
        case $ans in
            1)
                divider
                unset ans
                input s39
                
                changedir $ans $olddir 0
                ;;
            2)
                divider
                unset ans
                input s39
                changedir $ans $olddir 1
                ;;
            3)
                menu=1
                ;;
            *)
                error s19 0
                ;;
        esac
    
    done
    menu=0
}