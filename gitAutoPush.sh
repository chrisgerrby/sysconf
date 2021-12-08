#!/bin/sh
pushd ~/sysconf
git add . 
#echo 'Commit message:'
#read msg
#git commit -m "$msg"
git commit -m "$(sudo nix-env --list-generations --profile /nix/var/nix/profiles/system | grep current | awk '{print $1}')"
#sudo nix-env --list-generations --profile /nix/var/nix/profiles/system | grep current | awk '{print $1}'
git push git@github.com:chrisgerrby/sysconf.git
# sudo nixos-rebuild switch -I nixos-config=/etc/user/u/sysconf/configuration.nix
popd
