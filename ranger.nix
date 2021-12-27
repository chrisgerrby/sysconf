{ congig, pkgs, lib, ... }: {

# commands which are launched with :
environment.etc."/user/u/.config/ranger/commands.py".text = ''
'';

environment.etc."/user/u/.config/ranger/commands_full.py".text = ''
'';

# startup commands and key bindings
environment.etc."/user/u/.config/ranger/rc.conf".text = ''
  set colorscheme scheme
  set show_hidden true
  set preview_images true

map DD shell mv %s (getEnv "HOME")/.local/share/Trash/files/

'';

# applications used when a given type of file is launched
environment.etc."/user/u/.config/ranger/rifle.conf".text = ''

  else = xdg-open "$1"
  label editor = "$EDITOR" -- "$@"
  label pager  = "$PAGER" -- "$@"

'';

environment.etc."/user/u/.config/ranger/scope.sh".text = ''
'';

}
