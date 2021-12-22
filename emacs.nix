# https://nixos.wiki/wiki/Emacs
# { config, pkgs, lib, ... }: {
# 
#   nixpkgs.overlays = [
#     (import (builtins.fetchGit {
#       url = "https://github.com/nix-community/emacs-overlay.git";
#       ref = "master";
#       rev = "30332510bb5dd8b29439af32ba749139861c1dea";
#       }))
#   ];
#   #services.emacs.package = pkgs.emacsPgtk; # good w waylaynd
#   services.emacs.package = pkgs.emacsPgtk;
#   environment.systemPackages = with pkgs; [ emacsPgtk ];
# 
#   environment.etc."/user/u/sysconf/.emacs.d" = {
#   #environment.etc = rec {
#         source = builtins.FetchGit {
#           url = "https://github.com/syl20bnr/spacemacs";
#           #rev = ""
#           ref = "develop";
#         };
#     };
#      
#     #environment.etc."/user/u/sysconf/.spacemacs".text = '' '';
#     #environment.etc."/user/u/sysconf/.spacemacs".source = '' '';
#}


#### https://github.com/nix-community/emacs-overlay
{config, pkgs, callPackage, ... }: {

  services.emacs.package = pkgs.emacsUnstable;
  services.emacs.enable = true;

  nixpkgs.overlays = [
    (import (builtins.fetchTarball {
      url = https://github.com/nix-community/emacs-overlay/archive/master.tar.gz;
    }))
  ];
}
