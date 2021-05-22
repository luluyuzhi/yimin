#!/bin/sh -l


for TARGET in ./slidev/*
do
    if test -d $TARGET
    then
        echo -e "[${TARGET##*/}](./slidev/${TARGET##*/}/index.html)\r\n" >> source/Works/index.md
    fi
done
