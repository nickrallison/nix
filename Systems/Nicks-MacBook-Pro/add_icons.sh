#!/bin/sh
export path=$1 
export name=$(basename "${path}" | sed 's/.app//g')
if [ -e "$path" ]; then
  [ -d "${path}" ] && \
  cp ./Icons/${name}.icns "${path}/Contents/Resources/${name}.icns";
fi
