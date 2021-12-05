{ config, pkgs, lib, ... }:
{
  
  environment.systemPackages = with pkgs; [ 
    lispPackages.nyxt 
    nyxt 
  ];
  
  environment.etc."/etc/nyxt".text = ''

(DEFINE-CONFIGURATION (BUFFER WEB-BUFFER)
  ((DEFAULT-MODES (APPEND '(NYXT::VI-NORMAL-MODE) %SLOT-DEFAULT%))))
'';
}
