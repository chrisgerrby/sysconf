environment.vars
FILE = ranger
TERMINAL = 
UID = lower = better

programs.bash.shellAliases = {
  l = "ls -alh";
  ll = "ls -l";
  ls = "ls --color=tty";
};

environment.interactiveShellInit = ''
  alias gs='git status'
'';


##########################################
##########################################
##########################################

nix man , nixpkgs man, nixos man


boot.loader.timeout = null;
 # problematitc

networking.wireless.enable = true;

 LightDM does automatically start either X11 or Wayland depending on which you choose. 
 Of course, you can set the default graphical session with 
srvices.xserver.displayManager.defaultSession.
##########################################
##########################################
##########################################

environment.defaultPackages = nil

# A set of environment variables used in the global environment. These variables will be set on 
# shell initialisation (e.g. in /etc/profile). The value of each variable can be either a string or 
# a list of strings. The latter is concatenated, interspersed with colon characters.
environment.variables = 

# environment.etc."machine-id".source = "/nix/persist/etc/machine-id";

# Switch off the options in the default configuration that require X11 libraries. This includes 
# client-side font configuration and SSH forwarding of X11 authentication in. Thus, you probably do 
# not want to enable this option if you want to run X11 programs on this machine via SSH.
environment.noXlibs = 

powerManagement.powerDownCommands
powerManagement.resumeCommands
powerManagement.powerUpCommands # Commands executed when the machine powers up / starts from hibernation. 

powerManagement.cpufreq.min
powerManagement.cpufreq.max
powerManagement.cpuFreqGovernor
hardware.nvidia.powerManagement.enable



* ____________________________________ Configuration.nix cfgrt
"having one single file that defines the system" edit hardware-configuration and home.nix through this file 
https://www.reddit.com/r/NixOS/comments/ec3je7/managing_configurationnix_and_homenix/
 mkOverride, mkForce, mkDefault, mkOrder, mkBefore, mkAfter
services.tor.settings.DisableAllSwap = true;
services.dnscrypt-proxy.enable = true;
boot.consoleLogLevel = 0;
boot.resumeDevice = true; # I guess this makes os resume from swap from boot / hibernation
environment.etc."machine-id".text = "b7123812391293"; # to keep journald on system
    # https://www.reddit.com/r/NixOS/comments/kgziex/journald_not_keeping_past_boot_logs/




boot.loader.grub.extraEntries = ''
    menuentry "ISO" {
      do 
    }
    menuentry "Reboot" {
      reboot
    }
    menuentry "Poweroff" {
      halt
    }

 menuentry "Windows Boot Manager (on /dev/nvme0n1p2)" --class windows --class os {
   insmod part_gpt
   insmod fat
   search --no-floppy --fs-uuid --set=root 40E2-A3BF
          chainloader /EFI/Microsoft/Boot/bootmgfw.efi
}
  '';

* ____________________________________ Find Solutions / automation
firewall 
regestry
taskmanager
environment variabl
** sxhkd . arbitrary keyevents to arbitrary cmds, input += chords 
** actkbd  nope
        keyboard shortcut daemon
        https://nixos.wiki/wiki/Actkbd
find: 
     runtime macros,
** schreenshoting
      maim,  rectangle shoot 
      scrot
** sharex -> sharenix . import settings from sharex . https://github.com/Francesco149/sharenix .
    https://github.com/Gurkengewuerz/KShare 
** clipboard CopyQ 
   += timestamps . fuzzy, regex search . active window title .
** mark text, do w text .
** optical text recognition, do w text .
** hotstring (unicode) . espanso . emoji=ok
** hotstring (String) . espanso . multiline string
** hk to get prompt . randomnotes(tag1,tag2,...; note, time)
** hk to get prompt , type v for vivaldi / f for firefox , type g to search in google / gi for search in google images
   hkpromptregexmatch+query+enterlaunch/activate browser w query
** python-libxdo . wrapper around xlibdo [c] . fake keyboard/mouse input, window management, and more
** autokey . unicode via hotstring
** xkeysnail . very low lv . same as xdotools, autokey . looks really good . bind emacs bindings to anything or just windows?
** wmulits . hk -> manage windows
** xdotools . simulate input . change windows . keyinput . x11
** xautomation .
** xbindkeys  Xkb . independent of wm
** xmodmap . send unicode from hotkeys . maps keyboard X keycodes to a key name used in other sections
** xev . monitor and act on x events
** XCompose . to insert unicode?
** entr . automation per filechange
** shell
zsh
bash . because when googling about how to automate something, almost everything will be in bash
fish 
    easier than zsh - L Smith
    save your fish history backed up or in a dot file manager. 
    My Fish history is many years old now and Fish is practically telepathic as a result.
    Actually autocompletion in fish is done using the complete command there 1000s of handwritten auto complete files one for every command in the fish GitHub repo. 
    The autocompletion is so good thanks to work of hundreds of open source contributors who are constantly adding and improving auto completions
** key  switching keyboard layout .
   add this to conf . alt+space = switching 
       https://www.reddit.com/r/NixOS/comments/cwbl76/switching_between_keyboard_layouts/
     services = {
          xserver = {
            exportConfiguration = true; # link /usr/share/X11/ properly
            enable = true;
            layout = "us,it";
            xkbOptions = "eurosign:e, compose:menu, grp:alt_space_toggle";
    ** TODO left/right sensitive mod binding tool
** skr . lowlevel remap
 Altcodes . c-s u + [hexcode] . work more as hotstrings  they dont send on keydown
** program sensitive hotkeys
** keyhistory
** list pressed hotkeys

* ____________________________________ Packages pkg / Derivations drvt
 get most extensible/ software, not smallest 
 run lynx, tor, emacs as service &  when closed, stays as deamon -> run multiple sites to define word for example.
links browser
** browser nyxt tor 
** backups tar.7z.pgp
** fonts . https://nixos.wiki/wiki/Fonts
** theme gruvbox
** filemanager ranger
** launcher rofi dmenu
** terminal emulator rxvt
** wm i3 i3-gaps 
** image viewer sxiv 
   . suckless https://muennich.github.io/sxiv/sxiv.1.html
** video viewer mpv
** pdf viewer sathura
** youtube cli . mps-youtube
       output stream to any viewer?
       when browsing add (likes per dislikes) (wiews per year) can be biased due to clickbait, maybe 
** downloader . aria2 >curl,wget
        https://aria2.github.io
** adguard .
** torrent rtorrent /g/
** rss .  newsboat  elfeed
** xrandr ?
** cloud . dropbox exists
** bookmark manager . use tags in org .
       emacs , helm , hk to copy to clipboard (address, titlebar, time) , openedit bookmarks file , activate helm search , type , paste in org loc : much more powerful search, file loc safer , 
https://wiki.installgentoo.com/index.php/List_of_recommended_GNU/Linux_software
    IRC: Weechat or Irssi.
    VoIP: Mumble
    Media Player: mpv
    Music player: MPD and ncmpcpp, or ncmpc, or cmus.
    Image Viewer: feh or sxiv.
    Terminal Emulator: rxvt-unicode or st.
    File Manager: none or Ranger or Vifm.
    Document Reader: zathura
    Text Editor: Vim or Vim based.
** file search . similar to everything
    fsearch https://github.com/cboxdoerfer/fsearch
    also similar   
        ANGRYsearch : https://github.com/DoTheEvo/ANGRYsearch
        fzf : https://github.com/junegunn/fzf
        FileSearch : http://www.memecode.com/filesearch/
        rlocate
        locate
        recoll
        Catfish
        Doodle
weechat-matrix
spytify . does not exits, only in w10 scoop?
** spacemacs
    LSP nix https://emacs-lsp.github.io/lsp-mode/page/lsp-nix/
    NOX LSP client https://github.com/manateelazycat/nox/tree/56f6bbc13af1b41e9b8860165aa673108f3c3367
    run emacs as daemon 
    LaTex LSP server https://github.com/latex-lsp/texlab/tree/46edf2150c540ad461d046513b17c5e7ae0c2239 
 
 * ____________________________________ Terminal tmn cmds
 neofetch which
 top        running processes
 ncdu -x ~ to see files that will be deleted with each boot on homedir
 dmesg
 df -h find filesystems
 pstree 
 journalctl -xb -p3 # to directly see errors 
 tldr man help
 wipefs -f -a /dev/         delets all filesystems to repartition
 findfs
 libblkid       block device identification library
 blkid          find block attributes
 blkdiscard      selectevely wipes disk per block/sector etc 
 dd if=/dev/zero of=/dev/sdx bs=1024 count=50       wipes partition table
 cat /dev/zero > /dev/sdx       wipe entire disk, takes a while
 eject

nix search pkg
nix log
nix-build tool is used to build derivations from an expression.
find packages $ nix search emacs
info packages $ nix-env -qa --description '.*emacs.*'
conf manager ? home-manager  stow  flakes
nix search version
nixos-version
nix-channel
nix-shell
nix-rebuild
nix-env
nix-store 
nix-build 
chmod +x *.file
touch
git init
ls -lah see permissions, owner, links
echo $path
atop in logging mode, collumn SWAPSZ (?) to see pages being swapped


# ____________________________________  resulution
# https://wiki.archlinux.org/title/Xinit

3240 2160 px 
260 ppi
343 251 mm

environment invariant display / dpi / scaling settings 

# https://www.reddit.com/r/NixOS/comments/i960ev/how_can_i_set_a_default_xorg_config_on_nixos/
    # Instead of using Xft.dpi on your .Xresources file; set the dpi on your .xinitrc using xrandr --dpi <your dpi>

    # options handling xinitrc ?
    # services.xserver.config
    # services.xserver.extraConfig

display-manager gets config partly via .xsession, so 

system boot files > xdg > xserver

.xprofile
    in ~ and /etc  
    allows you to execute commands at the beginning of the X user session - before the window manager is started.
    can be sourced from .xsession, if started from programs [startx, xinit, XDM, ]
.xsession 
    display managers look this file on start
    change the Xcursor theme
    user-level configuration dotfile
    configure terminal preferences (e.g. terminal colors)
    set DPI, anti-aliasing, hinting and other X font settings
    dep xorg-xrdb
.xinitrc 
    things to load in when disptay serverstarts
    xinit = start x display server
.xresources
    user-level conf, typically in ~
.xserverrc
    starts up xserver
    executed by xstart & xinit
.xdefaults
    deprecated

shxkd
xrdb
    x database manager
xdotool 
    x automation tool 
    simulate input
xsetroot
    root window parameter setting utility for X
actkbd
    low-level, key-mapper. 
xbindkeys
    independent on windowmanager / desktop environment
xkb
    keyboard layouts
xmodmap
    only for simple tasks
dpyinfo
    utility for displaying information about an X server
xprop
    property displayer for x
xsel
    manipulate the X selection
    selected text
xev
    x events
acpid
    low-level event mapper
    eg volume button, headjack, lid_close

## # Create text file in a package folder
##    # https://discourse.nixos.org/t/create-text-file-in-a-package-folder/2287/2
## # Generic way to modify packages config files
##     https://discourse.nixos.org/t/generic-way-to-modify-packages-config-files/267
## # Overwrite default values in configuration.nix
##  https://discourse.nixos.org/t/solved-overwrite-default-values-in-configuration-nix-postfix-postscreen/1700/5
## # nixos modularity 
##  https://nixos.org/manual/nixos/stable/index.html#sec-modularity
## # How do I append text to a /etc/ configuration file in NixOS?
##  https://stackoverflow.com/questions/45575297/how-do-i-append-text-to-a-etc-configuration-file-in-nixos
## # Modify /etc/inputrc (or any other system file)
##  https://www.reddit.com/r/NixOS/comments/7e4yke/modify_etcinputrc_or_any_other_system_file/

emulate
    https://blog.jeaye.com/2017/07/30/nixos-revisited/
    https://libredd.it/r/NixOS/comments/out1tf/is_homemanager_a_good_idea/ "stelcodes"

info sources
    https://discourse.nixos.org/t/adding-folders-and-scripts/5114

  install & configure
    1. predefined program options via "nixos options"
    2. install via system.environment = with pkgs; [ pkg ];
         configure via 1. write conf in /etc/nixos/package.conf
         find configurationfile, if it actually resides in /etc/.conf
                     2. symlink to /etc/ via the environment.etc.<NAME>. 
       
       I put all my per-software configs in my NixOS config directory and I tell NixOS to put the those in /etc            
         many programs look at /etc/<NAME>.conf/
         if  programs look elwhere than in ~./    or    /etc/<NAME>.    then link it. 
          stepwise::: (1) put conf in /etc/nixos, (2) use environment.etc.<name>. to put it in /etc/  )
 

###   runs command on boot
 {
   boot.initrd.postDeviceCommands = lib.mkAfter ''
     command
   '';
 };

  environment.pathsToLink = [ "/libexec" ];
     

### does not trigger on reuild switch/test but on boot
### sets symlink /from    - - - - /to
   systemd.tmpfiles.rules = [
    "L /var/lib/bluetooth - - - - /persist/var/lib/bluetooth"
    ];

### start at boot
systemd.services.<name>.wantedBy

### make general service 
 systemd.services.<name> = { 
     wantedBy = [ multi.userTarg]
     startAt = "Sun 00:00:00";
     path = with pkgs; [ pkg_1 pkg_2 ];
     script = 
     ''
     '';
 };

### are not good, systemd better, 1 ref
##  https://discourse.nixos.org/t/automating-home-manager-setup/12245/2
### makes /mnt if doesn not exitst at boot and every nixos-rebuild switch/test

 system.activationScripts = {
     mnt = { 
         text = ''
             if [ ! -d /mnt ] ; then 
                 mkdir /mnt;
             fi
         '';
     deps = [];
     };
 };

## # ? if this file does not exist, is file functionally created ?
## seurity.pam.services.sudo.text = '' existing contents of /etc/pam.d/sudo  extra lines  '';
## security.pam.services.sudo.text = pkgs.lib.mkDefault( pkgs.lib.mkAfter "# hi" );
## 
## avoid using pkgs.lib.mkHek, can lead to infinite recursion. Use lib.mkHek, define lib in attribute

