#!/bin/bash
# Any new folders or files added need to also be added here, unless they are
# post-fixed with .sym

echo Linking files to home directory

for file in *.sym; do
  if [[ -f $file ]]; then
    ln -s `pwd`/$file ~/.${file%.sym} && echo linked $file
  # avoid copying twice (e.g. tmux.sym/tmux.sym)
  elif [[ -d $file && ! -d ~/.${file%.sym} ]]; then   
    ln -s `pwd`/$file ~/.${file%.sym} && echo linked dir $file
  fi
done

# copy other config files
echo Copying specific config files ...
echo ...

echo Symlinking Karabiner dir
# copy karabiner directory, since single file doesn't work for profile switching
ln -s `pwd`/other_config/karabiner/ ~/.config/

echo Done!



# removed
# <removed 6/2017> cp `pwd`/other_config/private.xml ~/Library/Application\ Support/Karabiner/private.xml 

