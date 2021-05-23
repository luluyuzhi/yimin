#!/bin/sh -l

# npm i -g create-slidev

ROOT=$PWD

for TARGET in ./slidev/*
do
    if test -d $TARGET
    then
        cd $TARGET
        npm install
        npm run build

        mkdir -p $ROOT/public/Works/slidev/${TARGET##*/}
        cp -r dist/* $ROOT/public/Works/slidev/${TARGET##*/}
        cd $ROOT
    fi
done
