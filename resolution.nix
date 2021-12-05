{ config, pkgs, lib, ... }:
{

# try disabling xfce
# i3-gaps , nvidia-settings worked
# saved sessions can f up, del those
# sway > i3
# mate desktop
# no desktop
# xrandr --dpi ...


hardware.video.hidpi.enable = true;

# high DPI font
#console.Font = "latarcyrheb-32";
#consolefont = "Lat2-Terminus16";
#console.font = "${pkgs.terminus_font}/share/consolefonts/ter-u28n.psf.gz";

services.xserver = {
		dpi = 260;
		monitorSection = '' DisplaySize 1296 864 '';
#invalid	resolutions = '' { "x":3240, "y":2160 } '';
};

environment.variables = {
		GDK_SCALE = "1.1";
 		GDK_DPISCALE = "0.2";
		QT_AUTO_SCREEN_FACTOR = "1";
		QT_DEVICE_PIXEL_RATIO = "1";
		XCURSOR_SIZE = "64";
		_JAVA_OPTIONS = "-Dsun.java2d.uiScale=2";
};


}
