{ config, pkgs, lib, ... }:{

# setup commands 
## mullvad set <account number>
## mullvad auto-connect set on:off
## mullvad always-require-vpn set on:off

services.mullvad-vpn.enable = true;
environment.systemPackages = with pkgs; [ mullvad-vpn ];
networking.wireguard.enable = true; 
networking.firewall.checkReversePath = "loose";

}

