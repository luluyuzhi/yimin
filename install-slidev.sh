#!/bin/sh -l


ROOT=$PWD

for TARGET in ./slidev/*
do
    if test -d $TARGET
    then
        cd $TARGET
        npm install
        npx slidev build

        mkdir -p $ROOT/public/Works/slidev/${TARGET##*/}
        cp -r dist/* $ROOT/public/Works/slidev/${TARGET##*/}
        ls -l $ROOT/public/Works/slidev/${TARGET##*/}
        cd $ROOT
    fi
done
