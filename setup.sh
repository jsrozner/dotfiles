#!/bin/bash

echo Linking files to home directory

for file in *.sym
do
   ln -s `pwd`/$file ~/.${file%.sym}
done
