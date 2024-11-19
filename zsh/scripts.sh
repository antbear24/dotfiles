#! /bin/zsh

compress () {
    tar cvzf $1.tar.gz $1
}

mkcd () {
    mkdir -pv $1 && cd $1
}

extract () {
    for file in "$@"
    do
        if [ -f $file ]; then
            _ex $file
        else
            echo "'$file' is not a valid file"
        fi
    done
}

# internal functions

_ex () {
    case $1 in
        *.tar.bz2)  tar xjf $1      ;;
        *.tar.gz)   tar xzf $1      ;;
        *.bz2)      bunzip2 $1      ;;
        *.gz)       gunzip  $1      ;;
        *.tar)      tar xf  $1      ;;
        *.tbz2)     tar xjf $1      ;;
        *.tgz)      tar xzf $1      ;;
        *.zip)      unzip   $1      ;;
        *.7z)       7z  x   $1      ;; #  require p7zip
        *.rar)      7z  x   $1      ;; #  require p7zip
        *.iso)      7z  x   $1      ;; #  require p7zip
        *.z)        uncompress  $1  ;;
        *)          echo "'$1' cannot be extracted" ;;
    esac
}
