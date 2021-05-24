#!/bin/sh -l


npm i -g yarn

yarn


# yarn workspaces run build

for TARGET in ./packages/*-slidev
do
    if test -d $TARGET
    then
    echo  $TARGET
        yarn run slidev build $TARGET/slides.md 
        # echo -e "[${TARGET##*/}](./slidev/${TARGET##*/}/index.html)\r\n" >> source/Works/index.md
    fi
done
