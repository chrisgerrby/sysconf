{ config, pkgs, lib, ... }: {

environment.etc."/user/u/.config/sxhkd/sxhkdrc".text = ''

# https://my-take-on.tech/2020/07/03/some-tricks-for-sxhkd-and-bspwm/
# inspiration

# shift numberpad / Å
#"printf '\xE2\x98\xA0'"
#  KP_Divide

# numberpad / å
#  KP_Divide

# shift numberpad * Ä
#  KP_Multiply

# numberpad * ä
#  KP_Multiply

# numberpad - ö
# works, but takes a half fucking second to print
#"xdotool key U00F6" #
#  KP_Subtract #+ Release

# shift numberpad - Ö
# "xvkbd -xsendevent -text 'ö'"
#   KP_Subtract

  # make sxhkd reload its configuration files:
  super + space
    pkill -USR1 -x sxhkd

  KP_Divide
    alacritty

  super + e
    ranger

  '';
}
