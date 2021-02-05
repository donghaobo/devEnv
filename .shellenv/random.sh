random() {
    n=10
    if [[ $# -ge 1 && $1 =~ ^[0-9]+$ ]];then
        n=$1
    fi
    while [[ $n -gt 0 ]];do
        ((n--))
        r=$RANDOM
        echo -ne "\x$(printf %x $((r%93+33)))"
    done
}
