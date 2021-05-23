#!/bin/sh -l

# npm i -g create-slidev

ROOT=$PWD

for TARGET in ./slidev/*
do
    if test -d $TARGET
    then
        cd $TARGET
        npm install
        npm config set registry https://registry.npm.taobao.org
        npx slidev build 1>/dev/null 2>&1

        mkdir -p $ROOT/public/Works/slidev/${TARGET##*/}
        cp -r dist/* $ROOT/public/Works/slidev/${TARGET##*/}
        cd $ROOT
    fi
done