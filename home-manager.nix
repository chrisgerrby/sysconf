{ config, pkgs, ... }:

let 
  home-manager = builtins.fetchGit {
    url = "https://github.com/rycee/home-manager.git";
    rev = "f6d1cad6ba228b81bf7045f1124aa99dfdcf3daa"; # the commit to fetch 
    ref = "master"; # the branch to follow: release-xx.yy for stable xnixos or master for nixos-unstable.
  };
in {
   imports = [ (import "${home-manager}/nixos") ];

   # nixos-rebuild build-vm
   # installs pkgs to /etc/profiles instead of ~/.nix-profile
   # uses system nixpkgs.
   # This saves an extra Nixpkgs evaluation, adds consistency, and removes the dependency on NIX_PATH, which is otherwise used for importing Nixpkgs.
   home-manager.useUserPackages = true;
   home-manager.useGlobalPkgs = true;
   # Here goes your home-manager config
   home-manager.users.u = {

# environment.etc = { 
# bashrc.text = lib.mkForce ''
# '';
#};

     home.packages = with pkgs; [ 
     ];

   };
}
