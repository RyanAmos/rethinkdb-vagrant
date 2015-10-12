#!/bin/bash

command -v vagrant &>/dev/null
if [ $? -eq 1 ]; then
  echo "vagrant: command not found"
  echo "Download & install vagrant from:"
  echo "http://vagrantup.com/"
  exit 1;
fi

CWD="$( cd -P "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
if [ ! -f "$CWD/Vagrantfile" ]; then
  echo "Could not find 'Vagrantfile'.";
  exit 1;
fi

vagrant up
