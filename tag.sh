#! /bin/bash
echo $1
git config --global user.email "licsak.zoltan@gmail.com"
git config --global user.name "LecsoBKW"
git tag -a $1 -m $1
git push origin $1
