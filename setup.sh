#!/bin/bash

echo Linking files to home directory

for file in *.sym
do
   ln -s `pwd`/$file ~/.${file%.sym}
done

# copy other config files
# cp `pwd`/other_config/private.xml ~/Library/Application\ Support/KeyRemap4MacBook/private.xml 
