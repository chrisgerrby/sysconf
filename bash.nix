{ config, pkgs, lib, ... }: {

    programs.bash.interactiveShellInit = ''

        # https://bluz71.github.io/2018/11/26/fuzzy-finding-in-bash-with-fzf.html
   	# make preview pdf 
	# swallow terminal, or alteast be independent of it
        p() {
          zathura "$(fzf --preview='head -$LINES {}' --reverse)"
	}

	# @Ripgrep integration
	## https://github.com/junegunn/fzf/blob/master/ADVANCED.md
	# https://gist.github.com/gnanderson/d74079d16714bb8b2822a7a07cc883d4
	# rga-fzf
	z() {
		RG_PREFIX="rga --files-with-matches"
		local file
		file="$(
			FZF_DEFAULT_COMMAND="$RG_PREFIX '$1'" \
				fzf --reverse --sort --preview="[[ ! -z {} ]] &&\
				rga --pretty -C 5 {q} {}" \
					--phony -q "$1" \
					--bind "change:reload:$RG_PREFIX {q}" \
					--preview-window="50%:wrap" \
		)" &&
		echo "opening $file" &&
		xdg-open "$file"
	}

    '';
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


  programs.bash = {
    enableCompletion = true;
    shellAliases = {
      e = "emacsclient";
      v = "nvim";
      s = "sudo su";
      r = "ranger";
      m = "man";
      n = "nnn";
      a = "rga -C 5";
      f = "fzf --preview --reverse 'bat --color=always --style=numbers --line-range :500 {}'";
      b = "bat -A";
      l = "exa -a -b -U -@ --header"; # --links --long --changed 
      "3" = "googler -l en -g us";
      "4" = "googler -l en -g us -j";
      "5" = "googler -l en -g us -V --url-handler mpv $argv";
      "6" = "googler -l en -g us -w youtube.com --url-handler mpv $argv";
      g = "/etc/user/u/sysconf/gitAutoPush.sh";
      nrs = "sudo nixos-rebuild switch -I nixos-config=/etc/user/u/sysconf/configuration.nix";
      nrt = "nixos-rebuild test -I nixos-config=/etc/user/u/sysconf/configuration.nix";
      nrb = "nixos-rebuild boot -I nixos-config=/etc/user/u/sysconf/configuration.nix";
      sn = "shutdown now";
      srn = "shutdown -r now";
      ncg = "nix-collect-garbage";
      ncu = "nix-channel --update";
      h = "cd ~ && exa --tree -L=3 --long";
      c = "cd /etc/user/u/sysconf && exa --long -B --header";
      ce = "nvim /etc/user/u/sysconf/configuration.nix";
      ".." = "cd .. && exa --tree -L=1 --header";
      #m = "man $1 | 'bat --color=always --style=numbers --line-range=:1000 {}'";
      #"exa --binary --header --long"
      #"exa --long --git"
      y = "youtube-dl -cwi --embed-thumbnail --add-metadata --no-mtime --no-overwrites --ignore-config --hls-prefer-native --download-archive /etc/user/u/ytdl/archive.txt -o /etc/user/u/ytdl%(title)s.%(etx)s";
      # y = "youtube-dl -cwi -f `"bestaudio[ext=m4a]`" --embed-thumbnail --add-metadata --no-mtime --no-overwrites --ignore-config --hls-prefer-native --download-archive /etc/user/u/ytdl/archive.txt -o /etc/user/u/ytdl%(title)s.%(etx)s";
    };
  };
}
