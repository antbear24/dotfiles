#! /bin/zsh

compress () {
    tar cvzf $1.tar.gz $1
}

mkcd () {
    mkdir -pv $1 && cd $1
}
