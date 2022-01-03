# man configuration.nix
{ config, pkgs, lib, callPackage, ... }:

 let
    spotify-4k = pkgs.symlinkJoin {
      name = "spotify";
      paths = [ pkgs.spotify ];
      nativeBuildInputs = [ pkgs.makeWrapper ];
      postBuild = ''
        wrapProgram $out/bin/spotify \
        --add-flags "--force-device-scale-factor=1.8"
        '';
      };

 in {

  imports = [
#     ./home-manager.nix
#     ./sway.nix
#     ./nyxt.nix
#     ./surfaceBook2.nix
#     ./i3.nix
#     ./resolution.nix
#     ./spotify.nix
      ./emacs.nix
      ./myvim.nix
      ./bash.nix
      ./sxhkd.nix
      ./xbindkeys.nix
      ./hardware-configuration.nix
      ./ranger.nix
      ./mullvad.nix
  ];

  fileSystems."/" = {
    device = "/dev/disk/by-label/nixos";
    fsType = "ext4";
  };
  fileSystems."/boot" = {
    device = "/dev/disk/by-label/boot";
    fsType = "vfat";
  };
  swapDevices = [ { device = "/dev/disk/by-label/swap"; } ];
  powerManagement.cpuFreqGovernor = "ondemand";

  ### schreen-hang  https://discourse.nixos.org/t/my-nixos-laptop-often-freezes/6381/4
  # https://git.ophanim.de/derped/nixos/src/commit/1424945b7df8698bbd2e256c48bf5d12c157513a/machines/Lilim/hardware-configuration.nix
  # https://github.com/NixOS/nixos-hardware/tree/master/microsoft/surface
  # https://github.com/linux-surface/linux-surface/wiki/Utilities-and-Packages
  hardware.firmware = with pkgs; [ firmwareLinuxNonfree ];
  hardware.cpu.intel.updateMicrocode = true;
  # 1 beg
  # imports = [ <nixos-hardware/microsoft/surface> ]
  boot.kernelPackages = pkgs.linuxPackages_latest;
  nixpkgs.config.packageOverrides = pkgs: {
        vaapiIntel = pkgs.vaapiIntel.override { enableHybridCodec = true; };
      };
      hardware.opengl = {
        enable = true;
        extraPackages = with pkgs; [
          vaapiIntel
          vaapiVdpau
          libvdpau-va-gl
          intel-media-driver
        ];
      };
  # 1 end
  # boot.kernelPackages = pkgs.linuxPackages_4_19;
  # boot.kernelPackages = [ surface ];
  # extra kernel modules must match kernel version
  # boot.extraModulePackages = with config.boot.kernelPackages; [ ];
  # boot time kernel command line arguments
  # boot.kernelParams = [ ];

  # kernel runtime parameters
  # see all via syscty -
  boot.kernel.sysctl =  {
    #"net.ipv4.tcp_syncookies" = false;
   # "vm.swappiness" = 70;
    "kernel.sysrq" = 1;
  };

 # https://github.com/linux-surface/surface-aggregator-module/wiki/Testing-and-Installing
 # CONFIG_SERIAL_DEV_BUS=y CONFIG_SERIAL_DEV_CTRL_TTYPORT=yi needs to be set,
 ## is set via nixos

  #suspend if powerbutton his bumped, rather than shutdown.
#  services.logind.lidSwitch = "ignore";
#  services.logind.extraConfig = ''
#    HandlePowerKey=suspend
#  '';

 # included surface-control # allowing control of the dGPU

  ################# init boot kernel ####################
  boot.loader.systemd-boot.enable = true;
  #boot.loader.timeout = null;
  boot.loader.efi.canTouchEfiVariables = true;
  #boot.loader.systemd-boot.consoleMode =  "max";

  #   services.getty = {
  #  	greetingLine = lib.mkForce "Welcome, u!";
  #  	helpLine = lib.mkForce "";
  #  	};

  nixpkgs.config = {
    allowBroken = true;
    allowUnfree = true;
    permittedInsecurePackages = [ "xpdf-4.03" "adobe-reader-9.5.5" ];
    #chromium = { chromium.enableWideVine = true; };
  };

  nix = {
    gc.automatic = true;
    gc.dates = "weekly";
    gc.options = "--delete-older-than 30d";
    autoOptimiseStore = true;
    extraOptions = ''
      min-free = ${toString (100 * 1024 * 1024)}
      max-free = ${toString (1024 * 1024 * 1024)}
    '';
   };

#   toggle between us, it keyboardlayout on !SPACE
#   services.xserver = {
#    exportConfiguration = true; # link /usr/share/X11/ properly
#      enable = true;
#      layout = "us,it";
#      xkbOptions = "eurosign:e, compose:menu, grp:alt_space_toggle";
#    };

#environment.gnome.excludePackages = [ pkgs.gnome.cheese pkgs.gnome-photos pkgs.gnome.gnome-music pkgs.gnome.gnome-terminal pkgs.gnome.gedit pkgs.epiphany pkgs.evince pkgs.gnome.gnome-characters pkgs.gnome.totem pkgs.gnome.tali pkgs.gnome.iagno pkgs.gnome.hitori pkgs.gnome.atomix pkgs.gnome-tour ];

# environment.gnome.excludedPackages = with pkgs; [gnome.cheese gnome-photos gnome.gnome-music gnome.gnome-terminal gnome.gedit epiphany evince gnome.gnome-characters gnome.totem gnome.tali gnome.iagno gnome.hitori gnome.atomix gnome-tour];

  services.xserver = {
    enable = true;
    layout = "us";
    #desktopManager.gnome.enable = true;
    desktopManager.pantheon.enable = true;
    #desktopManager.mate.enable = true; # USB tether did not work
    displayManager.lightdm.enable = true;
    displayManager.lightdm.greeter.enable = true;
    displayManager.autoLogin.enable = true;
    displayManager.autoLogin.user = "u";
    #autoRepeatDelay = 2000; #  milliseconds that a key must be before autorepeat starts
    #autoRepeatInterval = 70; # time between autorepeat-generated keystokes
    #	startx.enable = true;
    #autorun = true;
    #desktopManager.xfce.enable = true;
    #desktopManager.xfce.noDesktop = true;
    #desktopManager.xfce.enableXfwm = false;
    #desktopManager.xterm.enable = false;
    # allowing displayManagers to automatically choose this session
    # adding a session for a display manager to choose
    # displaymanager.session = { };
    #displayManager.defaultSession = "none+i3";
    #windowManager.bspwm.configFile = "/etc/nixos/bspwm";
    #windowManager.bspwm.sxhkd.configFile = "/etc/nixos/sxhkd";
    #libinput.enable = true;
    #config = '' ''; # misc
    #extraConfig = '' '';
  };

  # not for alacritty
  # synaptics.enable = false; # lib.mkForce f

  # Set your time zone.
  time.timeZone = "Sweden/stockholm";

  # The global useDHCP flag is deprecated, therefore explicitly set to false here.
  # Per-interface useDHCP will be mandatory in the future, so this generated config
  # replicates the default behaviour.

  #networking.networkmanager.enable = true; # better than wpa?
  networking.useDHCP = false;
  networking.interfaces.wlp1s0.useDHCP = true;
  networking.hostName = "u"; # Define your hostname.
  #networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.

  # Select internationalisation properties.
  i18n.defaultLocale = "en_US.UTF-8";
  # console = {  keyMap = "us"; };

  # services.printing.enable = true; # Enable CUPS to print documents.

  sound.enable = true;
  hardware.pulseaudio.enable = true;
  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.root.hashedPassword = "$6$OO/d1fIDgXpFZ7$Urtt2Wl.QgQW4Pfu4aF49D05ZyJPYvpLu3RIjxiwg1zsCLn0kceP9I7594VIDGSZxBcG4uJs8WxCTilmqgmdN0";
  users.users.u = {
    isNormalUser = true;
    #uid = 500; https://github.com/NixOS/nixpkgs/issues/12170
    home = "/etc/user/u";
    createHome = true;
    hashedPassword = "$6$OO/d1fIDgXpFZ7$Urtt2Wl.QgQW4Pfu4aF49D05ZyJPYvpLu3RIjxiwg1zsCLn0kceP9I7594VIDGSZxBcG4uJs8WxCTilmqgmdN0";
    extraGroups = [ "video" "wheel" "networkmanager" "power" "audio" "disk" "systemd-journal" "surface-control" ];
  };

  fonts.fontconfig.antialias = true;
  #fonts.fontconfig.dpi = 260;

  fonts.fonts = with pkgs; [
    # noto-fonts    noto-fonts-cjk    noto-fonts-emoji
    fira-code    fira-code-symbols
    font-awesome-ttf
    iosevka
    freetype dejavu_fonts
    terminus_font terminus_font_ttf
    ultimate-oldschool-pc-font-pack
    #emacs-all-the-icons-fon
    profont
    hack-font
  ];

#  programs.usbtop.enable = true;
#  services.usbguard.enable = true;
#  services.apcupsd.enable = true;

  environment.systemPackages = with pkgs; [
   # gnomeExtensions.transparent-panel
    gnomeExtensions.no-title-bar
    gnomeExtensions.hide-panel
   # gnomeExtensions.appindicator
    signal-desktop
    #p3x-onenote standardnotes # bwrap problem. because of /etc/user/u (?)
    vim # neovim vim_configurable #(import ./vim.nix)
    spotify-4k spotify-tui
    #mathematica
    tor-browser-bundle-bin vivaldi firefox #chromiumBeta google-chrome-beta google-chrome nyxt qutebrowser
    fontmatrix
    android-file-transfer
    foxitreader
    adobe-reader
    xpdf # pdftotxt
    zathura # mupdf search for pdf in packages :)
    git git-crypt gnupg pinentry_qt
    bitwarden monero-gui
    entr tmux tldr maim
    fzf bat exa ripgrep-all ripgrep
    sxhkd xbindkeys xvkbd
    xdotool
    #xclip copyq parcellite
    #ananmesis
    ####### automation
    # inotify-tools
    # pyinotify – high-level Python interface to inotify, makes it very easy to write Python based scripts for watching files.
    # IWatch – simple Perl script using inotify to watch files and directories, sending notifications of file changes by e-mail.
    # incron – inotify cron-like system; run commands when certain filesystem events occur.
    # logsend – daemon for e-mail notification of log file changes. Its inotify backend uses inotify-tools.
    # mswatch – keeps Unix mailboxes synchronized using inotify (or dnotify on older kernels).
    # inotail – a version of the tail utility which uses inotify to avoid polling for changes.
    # notitools – some useful inotify tools.
    # adhocify – can launch scripts upon inotify events. requires no config files.
    #   xlib.webcollage # decorate the screen with random images from the web
    #   xlib.xosview # X based system monitor
       xorg.xwininfo # window information utility for X
       xorg.xprop # property displayer for X
       xorg.xdpyinfo # display information utility for X
       #xorg.xrestop # monitor server resources used by X11 clients
    #ispell 
    aspell aspellDicts.en
    usbutils pciutils util-linux
    sysstat busybox toybox
    pstree #trace
    htop # active processes
    ncdu # disk usage
    #tail
    #slabtop # mem usag
    #readlink # read value of a symbolic link
    lsof #list open files
    #lsusb # list USB devices
    #lsmod # program to show the status of modules in the Linux Kernel
    # += insmod modprobe modinfo depmod
    lshw # list all hardware
    #lspc
    #lspci # list PCI devices
    #iostat # disk, cpu, network
    #ltrace # A library call tracer
    #glxinfo # gpu info
    killall # kills process by name
    udevil # mount fs w/o pw
    unzip
    alacritty kitty #putty cool-retro-term
    mpv mps-youtube youtube-dl
    ranger sxiv #aria2 rtorrent
    nix-prefetch-github   nix-index    nix-prefetch-scripts
  ];

 # disable files
 # environment.etc."/usr/include/X11/keysymdef.h".text

#  environment.sessionVariables = rec {
#    XDG_CACHE_HOME  = "\${HOME}/.cache";
#    XDG_CONFIG_HOME = "\${HOME}/.config";
#    XDG_BIN_HOME    = "\${HOME}/.local/bin";
#    XDG_DATA_HOME   = "\${HOME}/.local/share";
#    XKB_DEFAULT_LAYOUT MANPATH
#    PATH = [ "\${XDG_BIN_HOME}" ];
#  };

  environment.variables = {
    #PAGER = "bat -A";
    EDITOR = "emacsclient";
    VISUAL = "emacs";
    BROWSER = "vivaldi";
    TERMINAL = "kitty";
    #FILE =
    RUST_BACKTRACE = "1";
  };

  # Some programs need SUID wrappers, can be configured further or are
  # started in user sessions.
  # programs.mtr.enable = true;
  # programs.gnupg.agent = {
  #   enable = true;
  #   enableSSHSupport = true;
  # };

  # List services that you want to enable:

  services.openssh.enable = false;
  security.sudo.wheelNeedsPassword = false;
  # Open ports in the firewall.
  # networking.firewall.allowedTCPPorts = [ ... ];
  # networking.firewall.allowedUDPPorts = [ ... ];
  # Or disable the firewall altogether.
  # networking.firewall.enable = false;

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "21.11"; # Did you read the comment?

  services.pcscd.enable = true;
  programs.gnupg.agent = {
    enable = true;
    pinentryFlavor = "gtk2"; # gnome3 qt gtk2
  };

}
