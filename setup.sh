#!/bin/bash
# Any new folders or files added need to also be added here, unless they are
# post-fixed with .sym

echo Linking files to home directory

for file in *.sym
do
  if [[ -f $file || -d $file ]]; then
    ln -s `pwd`/$file ~/.${file%.sym} && echo linked $file
  fi
done

if 
# copy other config files
echo Copying specific config files ...
echo ...

echo Symlinking Karabiner dir
# copy karabiner directory, since single file doesn't work for profile switching
ln -s `pwd`/other_config/karabiner/ ~/.config/

echo Symlinking Jupyter dir
ln -s `pwd`/other_config/jupyter/ ~/.jupyter
#todo: install submodule for vim plugin for jupyter

echo Done!



# removed
# <removed 6/2017> cp `pwd`/other_config/private.xml ~/Library/Application\ Support/Karabiner/private.xml 

