# https://nixos.wiki/wiki/Emacs
{ config, pkgs, lib, ... }: {

  nixpkgs.overlays = [
    (import (builtins.fetchGit {
      url = "https://github.com/nix-community/emacs-overlay.git";
      ref = "master";
      rev = "30332510bb5dd8b29439af32ba749139861c1dea";
      }))
  ];
  #services.emacs.package = pkgs.emacsPgtk; # good w waylaynd
  services.emacs.package = pkgs.emacsPgtk;
  environment.systemPackages = with pkgs; [ emacsPgtk ];
  
#  environment.etc = rec {
#     "emacs.d" = 
#     {
#        source = builtins.FetchGit {
#          url = "https://github.com/syl20bnr/spacemacs";
#          #rev = ""
#          ref = "develop";
#        };
#    };
#     
#    ".spacemacs".text = '' '';
#    };
}
