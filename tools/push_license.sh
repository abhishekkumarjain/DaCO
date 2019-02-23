#!/usr/bin/env zsh 

# Credit: http://stackoverflow.com/questions/151677/tool-for-adding-license-headers-to-source-files

for i in `find ../PSNoC/ -type f -name "*"`
do
  if ! grep -q Copyright $i
  then
    cat ../LICENSE.txt $i >$i.new && mv $i.new $i
  fi
done 
