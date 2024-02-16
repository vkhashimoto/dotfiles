# Edit this configuration file to define what should be installed on
# your system. Help is available in the configuration.nix(5) man page, on
# https://search.nixos.org/options and in the NixOS manual (`nixos-help`).

{ config, lib, pkgs, ... }:

{
  imports =
    [ # Include the results of the hardware scan.
      ./hardware-configuration.nix
    ];

	time.timeZone = "America/Sao_Paulo";

	# networking
	networking = {
		#useDHCP = true;
		#interfaces.<interface-name>.useDHCP = true;
		networkmanager.enable = true;
		hostName = "maindev";
		firewall = {
			enable = true;
		};
	};

	# users
	users = {
		#mutableUsers = false;
		users.vkhashimoto = {
			isNormalUser = true;
			home = "/home/vkhashimoto";
			extraGroups = [ "wheel" "libvirtd" "networkmanager" ];
		};
	};

	# boot
	boot = {
		#kernelPackages = pkgs.linuxPackages_latest;
		extraModulePackages = with config.boot.kernelPackages; [ rtl8814au ];
		#kernelParams = [
		#	"debug"
		#];
		loader = {
			systemd-boot = {
				enable = true;
				consoleMode = "auto";
			};
			efi = {
				canTouchEfiVariables = true;
			};
		};
		initrd.luks.devices."droot".preLVM = true;
		initrd.luks.devices."droot".device = "/dev/disk/by-partlabel/droot";
	};
	
	# filesystems
	fileSystems."/" = {
		options = [ "noatime" "nodiratime" ];
	};
	fileSystems."/boot" = {
		options = [ "umask=077" ];
	};

	# nix
	nixpkgs = {
		config.allowUnfree = true;
	};
	

	# TODO: Enable Wi-Fi
  # Pick only one of the below networking options.
  # networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.
  # networking.networkmanager.enable = true;  # Easiest to use and most distros use this by default.

  # Select internationalisation properties.
  i18n.defaultLocale = "en_US.UTF-8";
  console = {
  #   font = "Lat2-Terminus16";
     keyMap = "br-abnt2";
  #   useXkbConfig = true; # use xkb.options in tty.
  };

  # X11
  services.xserver.xkb.layout = "br";
	services.xserver = {
		xrandrHeads = [
			{ output = "DP-1"; primary = false; }
			{ output = "HDMI-1"; primary = true; monitorConfig = "Option \"Below\" \"multihead1\""; }

		];
		enable = true;
		# TODO: Move this configuration to user settings
		windowManager.bspwm.enable = true;
		windowManager.bspwm.configFile = "/home/vkhashimoto/.config/bspwm/bspwmrc";
		# TODO: This code is needed on bootstrap
		#windowManager.bspwm.configFile = "/home/vkhashimoto/.config/bspwm/bspwmrc";
		#	''
		#		sxhkd &
		#		kitty &
		#	'';
		#windowManager.bspwm.sxhkd.package = pkgs.sxhkd;
		#windowManager.bspwm.sxhkd.configFile = pkgs.writeText "sxhkdrc"
		#	''
		#		super + Return
		#			kitty
		#	'';
	};
	
	# packages
	#TODO: Move packages to user level
	environment.systemPackages = with pkgs; [
		neovim
		git
		kitty
		firefox
		pavucontrol
		pciutils
		usbutils
		pamixer
	];

	# audio
	security.rtkit.enable = true;
	services.pipewire = {
		enable = true;
		alsa.enable = true;
		alsa.support32Bit = true;
		pulse.enable = true;
	};

	#TODO: Put this variable when launching dolphin
	environment.variables = {
		"QT_QPA_PLATFORMTHEME" = "qt5ct";
	};
	
  system.stateVersion = "23.11";
  virtualisation.libvirtd.enable = true;
  nix.settings.experimental-features = [ "nix-command" "flakes" ];

}

