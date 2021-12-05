{ config, pkgs, lib, ... }: {
  programs.bash = {
    enableCompletion = true;
    shellAliases = {
      v = "vim";
      s = "sudo su";
      r = "ranger";
      #m = "man $1 | 'bat --color=always --style=numbers --line-range=:1000 {}'";
      m = "man";
      f = "fzf --preview 'bat --color=always --style=numbers --line-range=:1000'";
      b = "bat -A";
      l = "exa -a --long -b --changed -U -@ --header --links";
      nrs = "sudo nixos-rebuild switch -I nixos-config=/etc/user/u/sysconf/configuration.nix";
      nrt = "nixos-rebuild test";
      nrb = "nixos-rebuild boot";
      srn = "shutdown -r now";
      ncg = "nix-collect-garbage";
      ncu = "nix-channel --update";

      y = "youtube-dl -cwi --embed-thumbnail --add-metadata --no-mtime --no-overwrites --ignore-config --hls-prefer-native --download-archive /etc/user/u/ytdl/archive.txt -o /etc/user/u/ytdl%(title)s.%(etx)s";

      # y = "youtube-dl -cwi -f `"bestaudio[ext=m4a]`" --embed-thumbnail --add-metadata --no-mtime --no-overwrites --ignore-config --hls-prefer-native --download-archive /etc/user/u/ytdl/archive.txt -o /etc/user/u/ytdl%(title)s.%(etx)s";

      #"exa --binary --header --long"
      #"exa --long --git"
      h = "cd ~ && exa --tree -L=3 --long";
      c = "cd /etc/nixos && exa --long -B --header";
      ce = "vim /etc/nixos/configuration.nix";
      ".." = "cd .. && exa --tree -L=1 --header";
    };
  };

#       shellInit = '' alias 
#       enable = true;
#       loginShell =
#       	alias ls='ls -hf --color=tty'
#               
#       	       pastebin()
#       	       {
#       		local url='https//paste.c-net.org/'
#       		if (( $# )); then
#       			local file
#       	#		for file; do
#       	#			curl -s \
#       	#				--data-binary @"$file" \
#       	#				--header"X-FileName: ${file##*/}" \
#       	#				"$url"
#       	#			done
#       	#		else
#       	#			curl -s --data-binary @- "$url"
#       	#	fi
#       	#       } 
#       #'';
}
