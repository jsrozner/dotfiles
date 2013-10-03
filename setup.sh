#!/bin/bash

echo Linking files to home directory

for file in *.sym
do
  if [ -f $file ]; then
    ln -s `pwd`/$file ~/.${file%.sym}
  fi
done

# copy other config files
# cp `pwd`/other_config/private.xml ~/Library/Application\ Support/KeyRemap4MacBook/private.xml 
