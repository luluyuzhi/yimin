#!/bin/sh -l

npm i -g yarn

yarn

for TARGET in ./packages/*-slidev
do
    if test -d $TARGET
    then
        echo  $TARGET
        yarn run slidev build $TARGET/slides.md --base /Works/${TARGET##*/}
        mv dist ${TARGET##*/}
        echo  "[${TARGET##*/}](./${TARGET##*/}/index.html)" >> ./packages/yimin/source/Works/index.md
    fi
done

yarn workspace yimin run build