#!/bin/sh
pushd ~/sysconf
git add . 
echo 'Commit message:'
read msg
git commit -m "$msg"
git push git@github.com:chrisgerrby/sysconf.git
popd
