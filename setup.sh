#!/bin/bash

echo Linking files to home directory

for file in .
do
   if [ -f $file ]; then
      if [ ! -f $file ]; then
         echo Linking $file
         ln -s $file ~/.$file
      else
         echo $file already exists in home directory
         echo remove it to overwrite
      fi
   fi
done
