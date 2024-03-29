{ config, pkgs, lib, ...}: {

environment.etc."/user/u/.xbindkeysrc".text = ''

###########################################################################################
# after modifying script, reload it by running 1. killall xbindkeys, 2. xbindkeys

"bash /etc/user/u/sysconf/scripts/mpvHover.sh"
  m:0x0 + c:70 #f4

"bash /etc/user/u/sysconf/scripts/mpvTitlebar.sh"
 m:0x0 + c:74 #F8

# open file
#"xdg-open ~/sysconf/configuration.nix"
#"firefox"
  #m:0x0 + c:73

# The format of a command line is:
#    "command to start"
#       associated key
#
# A list of keys is in /usr/include/X11/keysym.h and in
# /usr/include/X11/keysymdef.h
# The XK_ is not needed.
#
# List of modifier:
#   Release, Control, Shift, Mod1 (Alt), Mod2 (NumLock),
#   Mod3 (CapsLock), Mod4, Mod5 (Scroll).
#

# The release modifier is not a standard X modifier, but you can
# use it if you want to catch release events instead of press events

# By defaults, xbindkeys does not pay attention with the modifiers
# NumLock, CapsLock and ScrollLock.
# Uncomment the lines above if you want to pay attention to them.

#keystate_numlock = enable
#keystate_capslock = enable
#keystate_scrolllock= enable

# Examples of commands:

# "xbindkeys_show" control+shift + q

# set directly keycode (here control + f with my keyboard)
# "xterm" c:41 + m:0x4

# specify a mouse button
# "xterm" control + b:2

#"xterm -geom 50x20+20+20"
#   Shift+Mod2+alt + s
#
## set directly keycode (here control+alt+mod2 + f with my keyboard)
#"xterm"
#  alt + c:0x29 + m:4 + mod2
#
## Control+Shift+a  release event starts rxvt
#"rxvt"
#  release+control+shift + a
#
## Control + mouse button 2 release event starts rxvt
#"rxvt"
#  Control + b:2 + Release

  '';
}
