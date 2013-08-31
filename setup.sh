#!/bin/bash

echo Linking files to home directory

for file in .
do
   if [ -f $file ]; then
      echo Linking $file
      ln -s $file ~/.$file
   fi
done
