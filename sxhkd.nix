{ config, pkgs, lib, ... }: {

environment.etc."/user/u/.config/sxhkd/sxhkdrc".text = ''

  super + space
    kitty 

  super + e
    ranger
  '';
}
