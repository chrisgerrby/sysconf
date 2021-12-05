{ config, pkgs, lib, ... }: {

environment.etc."/etc/user/u/.config/sxhkd".text =
  ''

super + return
    i3 alacritty

super + space
    alacritty

super + e
    ranger



  '';
}
