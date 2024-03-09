{ config, pkgs, pkgs-unstable, ... }:

{
	imports = [
		./modules/polybar.nix
		./sh.nix
	];
  # Home Manager needs a bit of information about you and the paths it should
  # manage.
  home.username = "vkhashimoto";
  home.homeDirectory = "/home/vkhashimoto";

  # This value determines the Home Manager release that your configuration is
  # compatible with. This helps avoid breakage when a new Home Manager release
  # introduces backwards incompatible changes.
  #
  # You should not change this value, even if you update Home Manager. If you do
  # want to update the value, then make sure to first check the Home Manager
  # release notes.
  home.stateVersion = "23.11"; # Please read the comment before changing.

	# update cache
	fonts.fontconfig.enable = true;
  # The home.packages option allows you to install Nix packages into your
  # environment.
  home.packages = [
    # # Adds the 'hello' command to your environment. It prints a friendly
    # # "Hello, world!" when run.
    #pkgs.hello
    pkgs.bash
    pkgs.bspwm
    pkgs.sxhkd
    pkgs.qemu
    pkgs.libvirt
    pkgs.virt-manager
    pkgs.rofi
    pkgs.polybar
    pkgs.dconf
    pkgs.libsForQt5.dolphin
    pkgs.libsForQt5.qt5ct
    pkgs.vlc
    pkgs.iosevka
    #pkgs.jetbrains-mono
    #pkgs.pureref
    pkgs.godot_4
    pkgs.keepassxc

    # # It is sometimes useful to fine-tune packages, for example, by applying
    # # overrides. You can do that directly here, just don't forget the
    # # parentheses. Maybe you want to install Nerd Fonts with a limited number of
    # # fonts?
    # (pkgs.nerdfonts.override { fonts = [ "FantasqueSansMono" ]; })

    # # You can also create simple shell scripts directly inside your
    # # configuration. For example, this adds a command 'my-hello' to your
    # # environment:
    # (pkgs.writeShellScriptBin "my-hello" ''
    #   echo "Hello, ${config.home.username}!"
    # '')
  ];

  #programs.blender.package = pkgs.blender.override {
	#cudaSupport = true;
  #};

  # Home Manager is pretty good at managing dotfiles. The primary way to manage
  # plain files is through 'home.file'.
  home.file = {
    # # Building this configuration will create a copy of 'dotfiles/screenrc' in
    # # the Nix store. Activating the configuration will then make '~/.screenrc' a
    # # symlink to the Nix store copy.
    # ".screenrc".source = dotfiles/screenrc;

    # # You can also set the file content immediately.
    # ".gradle/gradle.properties".text = ''
    #   org.gradle.console=verbose
    #   org.gradle.daemon.idletimeout=3600000
    # '';
  };

  # Home Manager can also manage your environment variables through
  # 'home.sessionVariables'. If you don't want to manage your shell through Home
  # Manager then you have to manually source 'hm-session-vars.sh' located at
  # either
  #
  #  ~/.nix-profile/etc/profile.d/hm-session-vars.sh
  #
  # or
  #
  #  /etc/profiles/per-user/vkhashimoto/etc/profile.d/hm-session-vars.sh
  #
  home.sessionVariables = {
    # EDITOR = "emacs";
  };


	programs.rofi = {
		enable = true;
	};



	#background-color = "#FFFFFF";

#	services.polybar = {
#		enable = true;
#		script = "/usr/bin/env polybar main &";
#		config = {
#			"bar/main" = {
#				monitor = "HDMI-1";
#				line-size = 7;
#				width = "90%";
#				height = 22;
#				offset-x = "6%";
#				offset-y = "1%";
#				radius = "6.0";
#				fixed-center = true;
#				bottom = false;
#				separator = "|";
#				modules-right = "date";
#				background = "#272932";
#				foreground = "#37EBF3";
#			};
#			"module/date" = {
#				"type" = "internal/date";
#				"interval" = "5.0";
#				"date" = "%Y-%m-%d";
#				"time" = "%H:%M";
#				"label" = "%date% %time%";
#			};
#		};
#	};

	systemd.user.services.polybar = {
		Install.WantedBy = [ "graphical-session.target" ];
	};
	home.file.".config/bspwm/bspwmrc".source = .config/bspwm/bspwmrc;
	home.file.".config/sxhkd/sxhkdrc".source = .config/sxhkd/sxhkdrc;
	home.file.".config/polybar/show-hide.sh" = {
		source = .config/polybar/show-hide.sh;
		#TODO: Make executable only for the user
		executable = true;
	};
	home.file.".config/polybar/pipewire.sh" = {
		source = .config/polybar/pipewire.sh;
		executable = true;
	}; 
	home.file.".config/nvim/init.lua".text = ''
vim.api.nvim_set_keymap("i", "jk", "<ESC>", { noremap = true} )
	'';
	#TODO: Change the font with a variable
	home.file.".config/kitty/kitty.conf".text =''
	font_family Iosevka
	bold_font Iosevka Bold
	italic_font Iosevka Italic
	bold_italic_font auto
	font_size 14.0
	'';

	dconf = {
		enable = true;
		settings = {
			"org/virt-manager/virt-manager/connections" = {
				autoconnect = [ "qemu:///system" ];
				uris = [ "qemu:///system" ];
			};
		};
	};


  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
}
