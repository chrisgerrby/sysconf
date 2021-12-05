# https://nixos.wiki/wiki/Sway

{ config, pkgs, lib, ... }: {
  
  #  open qt5ct and pick your theme
  programs.qt5ct.enable = true;

  programs.bash.loginShellInit = ''
    if [ -z $DISPLAY ] && [ "$(tty)" = "/dev/tty1" ]; then\ exec sway\ fi\
  '';

  programs.sway = {
    enable = true;
    wrapperFeatures.gtk = true; # so that gtk works properly
    extraPackages = with pkgs; [
      #waybar
      brighnessctl 
      flashfocus
      swayidle
      autotiling
      xwayland # for legac
      wl-clipboard
      mako # notification daemon
      alacritty # Alacritty is the default terminal in the config
      wofi #dmenu # Dmenu is the default in the config but i recommend wofi since its wayland native
      kanshi # randr
      gtk-engine-murrine
      gtk_engines
      gsettings-desktop-schemas
      lxappearance
    ];
  };

 # Here we but a shell script into path, which lets us start sway.service (after importing the environment of the login shell).
  environment.systemPackages = with pkgs; [
    (
      pkgs.writeTextFile {
        name = "startsway";
        destination = "/bin/startsway";
        executable = true;
        text = ''
          #! ${pkgs.bash}/bin/bash
          # first import environment variables from the login manager
          systemctl --user import-environment
          # then start the service
          exec systemctl --user start sway.service
        '';
      }
    )
  ]; 

  systemd.user.targets.sway-session = {
      description = "Sway compositor session";
      documentation = [ "man:systemd.special(7)" ];
      bindsTo = [ "graphical-session.target" ];
      wants = [ "graphical-session-pre.target" ];
      after = [ "graphical-session-pre.target" ];
    };

  systemd.user.services.sway = {
    description = "Sway - Wayland window manager";
    documentation = [ "man:sway(5)" ];
    bindsTo = [ "graphical-session.target" ];
    wants = [ "graphical-session-pre.target" ];
    after = [ "graphical-session-pre.target" ];
    # We explicitly unset PATH here, as we want it to be set by
    # systemctl --user import-environment in startsway
    environment.PATH = lib.mkForce null;
    serviceConfig = {
      Type = "simple";
      ExecStart = ''
        ${pkgs.dbus}/bin/dbus-run-session ${pkgs.sway}/bin/sway --debug
      '';
      Restart = "on-failure";
      RestartSec = 1;
      TimeoutStopSec = 10;
    };
  };


  systemd.user.services.kanshi = {
    description = "Kanshi output autoconfig ";
    wantedBy = [ "graphical-session.target" ];
    partOf = [ "graphical-session.target" ];
    serviceConfig = {
      # kanshi doesn't have an option to specifiy config file yet, so it looks
      # at .config/kanshi/config
      ExecStart = ''
        ${pkgs.kanshi}/bin/kanshi
      '';
      RestartSec = 5;
      Restart = "always";
    };
  };

 # Note: swayidle will fail cryptically if it cannot find sh in PATH, so you must provide this if you create a service file for it. An example is below:
 systemd.user.services.swayidle = {
     description = "Idle Manager for Wayland";
     documentation = [ "man:swayidle(1)" ];
     wantedBy = [ "sway-session.target" ];
     partOf = [ "graphical-session.target" ];
     path = [ pkgs.bash ];
     serviceConfig = {
       ExecStart = '' ${pkgs.swayidle}/bin/swayidle -w -d \
         timeout 300 '${pkgs.sway}/bin/swaymsg "output * dpms off"' \
         resume '${pkgs.sway}/bin/swaymsg "output * dpms on"'
       '';
     };
   };

 environment.etc.
   #programs.waybar.enable = true;
   #"/waybar/config".source = ./dotfiles/waybar/config;
   #"/waybar/style.css".source = ./dotfiles/waybar/style.css;
   "/sway/config".text = ''
    # input * xkb_layout "de"
    # input * xkb_variant "nodeadkeys"
    # input 2:7:SynPS/2_Synaptics_TouchPad { tap enabled }
    
    ### Variables
    set $mod Mod4 # Logo key. Use Mod1 for Alt.
    
    # Home row direction keys, like vim
    set $left h
    set $down j
    set $up k
    set $right l
    
    # Your preferred terminal emulator
    set $term cool-retro-terminal
    
    # Your preferred application launcher
    # Note: it's recommended that you pass the final command to sway
    #set $menu dmenu_path | dmenu | xargs swaymsg exec --
    set $menu cool-retro-terminal --name=launcher -e "bash -c 'compgen -c | sort -u | fzf --no-extended --print-query | tail -n1 | xargs -r swaymsg -t command exec'"
    for_window [app_id="^launcher$"] floating enable, border none
    
    set $passmenu cool-retro-terminal --name=passlauncher -e "fzf-pass"
    for_window [app_id="^passlauncher$"] floating enable, border none
    
    ### Output configuration
    # Default wallpaper (more resolutions are available in @datadir@/backgrounds/sway/)
    # output * bg /home/m/config/x/current_wallpaper fill
    
    # Example configuration:
    #   output HDMI-A-1 resolution 1920x1080 position 1920,0
    # You can get the names of your outputs by running: swaymsg -t get_outputs
    
    ### Idle configuration
    # Example configuration:
    exec swayidle -w \
             timeout 300 'swaylock -f -c 000000' -i ~/config/x/current_wallpaper \
             timeout 600 'swaymsg "output * dpms off"' \
                  resume 'swaymsg "output * dpms on"' \
             before-sleep 'swaylock -f -c 000000' -i ~/config/x/current_wallpaper 
    #
    # This will lock your screen after 300 seconds of inactivity, then turn off
    # your displays after another 300 seconds, and turn your screens back on when
    # resumed. It will also lock your screen before your computer goes to sleep.
    
    # bindsym Mod4+Shift+t exec "swaylock -i ~/config/x/current_wallpaper"
    
    ### Input configuration
    #
    # Example configuration:
    #
    #   input "2:14:SynPS/2_Synaptics_TouchPad" {
    #       dwt enabled
    #       tap enabled
    #       natural_scroll enabled
    #       middle_emulation enabled
    #   }
    #
    # You can get the names of your inputs by running: swaymsg -t get_inputs
    # Read `man 5 sway-input` for more information about this section.
    
    ### Key bindings
    #
    # Basics:
    #
        # start a terminal
        bindsym $mod+Return exec $term
    
        # kill focused window
        bindsym $mod+Shift+q kill
    
        # start your launcher
        bindsym $mod+p exec $menu
        bindsym $mod+Shift+p exec $passmenu
    
        # Drag floating windows by holding down $mod and left mouse button.
        # Resize them with right mouse button + $mod.
        # Despite the name, also works for non-floating windows.
        # Change normal to inverse to use left mouse button for resizing and right
        # mouse button for dragging.
        floating_modifier $mod normal
    
        # reload the configuration file
        bindsym $mod+Shift+c reload
    
        # exit sway (logs you out of your Wayland session)
        bindsym $mod+Shift+e exec swaynag -t warning -m 'You pressed the exit shortcut. Do you really want to exit sway? This will end your Wayland session.' -b 'Yes, exit sway' 'swaymsg exit'
    # Moving around:
        # Move your focus around
        bindsym $mod+$left focus left
        bindsym $mod+$down focus down
        bindsym $mod+$up focus up
        bindsym $mod+$right focus right
    
        # or use $mod+[up|down|left|right]
        # bindsym $mod+Left focus left
        # bindsym $mod+Down focus down
        # bindsym $mod+Up focus up
        # bindsym $mod+Right focus right
    
        # _move_ the focused window with the same, but add Shift
        bindsym $mod+Shift+$left move left
        bindsym $mod+Shift+$down move down
        bindsym $mod+Shift+$up move up
        bindsym $mod+Shift+$right move right
    
        # ditto, with arrow keys
        #bindsym $mod+Shift+Left move left
        #bindsym $mod+Shift+Down move down
        #bindsym $mod+Shift+Up move up
        #bindsym $mod+Shift+Right move right
    
    # Workspaces:
        # switch to workspace
        bindsym $mod+1 workspace 1
        bindsym $mod+2 workspace 2
        bindsym $mod+3 workspace 3
        bindsym $mod+4 workspace 4
        # bindsym $mod+5 workspace 5
        # bindsym $mod+6 workspace 6
        # bindsym $mod+7 workspace 7
        # bindsym $mod+8 workspace 8
        # bindsym $mod+9 workspace 9
        # bindsym $mod+0 workspace 10
        # move focused container to workspace
        bindsym $mod+Shift+1 move container to workspace 1
        bindsym $mod+Shift+2 move container to workspace 2
        bindsym $mod+Shift+3 move container to workspace 3
        bindsym $mod+Shift+4 move container to workspace 4
        #bindsym $mod+Shift+5 move container to workspace 5
        #bindsym $mod+Shift+6 move container to workspace 6
        #bindsym $mod+Shift+7 move container to workspace 7
        #bindsym $mod+Shift+8 move container to workspace 8
        #bindsym $mod+Shift+9 move container to workspace 9
        #bindsym $mod+Shift+0 move container to workspace 10
        # Note: workspaces can have any name you want, not just numbers.
        # We just use 1-10 as the default.
    # Layout stuff:
        # You can "split" the current object of your focus with
        # $mod+b or $mod+v, for horizontal and vertical splits
        # respectively.
        bindsym $mod+u splitv
        bindsym $mod+i splith
    
        # Switch the current container between different layout styles
        bindsym $mod+s layout stacking
        bindsym $mod+m layout tabbed
        bindsym $mod+t layout toggle split
    
        # Make the current focus fullscreen
        bindsym $mod+f fullscreen
        bindsym Mod4+Shift+f fullscreen toggle global
    
        # Toggle the current focus between tiling and floating mode
        bindsym $mod+Shift+space floating toggle
    
        # Swap focus between the tiling area and the floating area
        bindsym $mod+space focus mode_toggle
    
        # move focus to the parent container
        bindsym $mod+a focus parent
        bindsym $mod+d focus child
    # Scratchpad:
        # Sway has a "scratchpad", which is a bag of holding for windows.
        # You can send windows there and get them back later.
    
        # Move the currently focused window to the scratchpad
        bindsym $mod+Shift+minus move scratchpad
    
        # Show the next scratchpad window or hide the focused scratchpad window.
        # If there are multiple scratchpad windows, this command cycles through them.
        bindsym $mod+minus scratchpad show
    # Resizing containers:
    mode "resize" {
        # left will shrink the containers width
        # right will grow the containers width
        # up will shrink the containers height
        # down will grow the containers height
        bindsym $left resize shrink width 20px
        bindsym $down resize grow height 20px
        bindsym $up resize shrink height 20px
        bindsym $right resize grow width 20px
    
        # ditto, with arrow keys
        #bindsym Left resize shrink width 10px
        #bindsym Down resize grow height 10px
        #bindsym Up resize shrink height 10px
        #bindsym Right resize grow width 10px
    
        # return to default mode
        bindsym Return mode "default"
        bindsym Escape mode "default"
    }
    bindsym $mod+r mode "resize"
    
    # Status Bar:
    # Read `man 5 sway-bar` for more information about this section.
      # bar { swaybar_command waybar }
    
    gaps inner 20
    smart_gaps on
    
    # Pulse Audio controls
    # bindsym XF86AudioRaiseVolume exec --no-startup-id pactl set-sink-volume 0 +5%
    # bindsym XF86AudioLowerVolume exec --no-startup-id pactl set-sink-volume 0 -5%
    # bindsym XF86AudioMute exec --no-startup-id pactl set-sink-mute 0 toggle
    # bindsym XF86MonBrightnessUp exec --no-startup-id light -A 10
    # bindsym XF86MonBrightnessDown exec --no-startup-id light -U 10
    
    # Media player controls
    # bindsym XF86AudioPlay exec --no-startup-id mpc toggle
    # bindsym XF86AudioPause exec --no-startup-id mpc toggle
    
    #include @sysconfdir@/sway/config.d/*
    
    for_window [app_id=".*"] border none
    
    # notification daemon
    exec mako

   '';

}
