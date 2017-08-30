#!/bin/bash

#By github.com/m41k

END="https://raw.githubusercontent.com/m41k/kurupira/master/dic/"

if [ -z $1 ]; then
  wget -qO - $END/index
   else
  wget -qO - $END/$1

fi
