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
		useDHCP = true;
		#interfaces.<interface-name>.useDHCP = true;
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
			extraGroups = [ "wheel" ];
		};
	};

	# boot
	boot = {
		#kernelPackages = pkgs.linuxPackages_latest;
		kernelParams = [
			"debug"
		];
		loader = {
			systemd-boot = {
				enable = true;
				consoleMode = "auto";
			};
			efi = {
				canTouchEfiVariables = true;
				#efiSysMountPoint = "/boot/efi";
			};
		};
		initrd.luks.devices."root".preLVM = true;
		initrd.luks.devices."root".device = "/dev/disk/by-partlabel/root";
		#initrd.luks.devices.crypt = {
		#	device = "/dev/sda2";
		#	preLVM = true;
		#};
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
	

  # Pick only one of the below networking options.
  # networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.
  # networking.networkmanager.enable = true;  # Easiest to use and most distros use this by default.

  # Set your time zone.
  # time.timeZone = "Europe/Amsterdam";

  # Configure network proxy if necessary
  # networking.proxy.default = "http://user:password@proxy:port/";
  # networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";

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
		enable = true;
		# TODO: Move this configuration to user settings
		windowManager.bspwm.enable = true;
		#windowManager.bspwm.configFile = pkgs.writeShellScript "bspwmrc"
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
	environment.systemPackages = with pkgs; [
		neovim
		git
		kitty
		firefox
	];
  system.stateVersion = "23.11";
  nix.settings.experimental-features = [ "nix-command" "flakes" ];

}

