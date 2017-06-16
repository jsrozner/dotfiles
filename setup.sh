#!/bin/bash

echo Linking files to home directory

for file in *.sym
do
  if [ -f $file ]; then
    ln -s `pwd`/$file ~/.${file%.sym}
  fi
done

# copy other config files
echo Copying specific config files ...
echo ...

echo Copying karabiner
ln -s `pwd`/other_config/karabiner.json ~/.config/karabiner/karabiner.json



# removed
# <removed 6/2017> cp `pwd`/other_config/private.xml ~/Library/Application\ Support/Karabiner/private.xml 

