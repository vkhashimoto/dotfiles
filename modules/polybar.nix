{ inputs, pkgs, ... }:

let 
	background-color = "#272932";
	foreground-color = "#D1C5C0";
	separator-color = "#CB1DCD";
	underline-color = "#37EBF3";
	alert-color = "#ea00d9";
in {

	config = {
		services.polybar = {
			enable = true;
			script = "/usr/bin/env polybar main &";
			config = {
				"bar/main" = {
					monitor = "HDMI-0";
					line-size = 7;
					width = "90%";
					height = 22;
					offset-x = "5%";
					offset-y = "1%";
					radius = "6.0";
					fixed-center = true;
					bottom = false;
					separator = "|";
					separator-foreground = separator-color;
					modules-left = "bspwm";
					modules-center = "title";
					modules-right = "cpu memory filesystem pipewire date";
					module-margin = 1;
					background = background-color;
					foreground = foreground-color;
					enable-ipc = true;
				};
				"module/date" = {
					"type" = "internal/date";
					"interval" = "5.0";
					"date" = "%Y-%m-%d";
					"time" = "%H:%M";
					"label" = "%date% %time%";
				};
				"module/bspwm" = {
					type = "internal/bspwm";
					format = "<label-monitor><label-state><label-monitor>";
					label-monitor = "|";
					label-monitor-foreground = separator-color;
					pin-workspaces = false;
					label-separator = "|";
					label-separator-foreground = separator-color;
					label-focused-underline = underline-color;
					label-focused = "%name%";
					label-occupied = "%name%";
					label-urgent = "%name%";
					label-empty = "%name%";
					label-focused-padding = 1;
					label-occupied-padding = 1;
					label-empty-padding = 1;
				};
				"module/filesystem" = {
					type = "internal/fs";
					mount-0 = "/";
					interval = 60;
					warn-percentage = 80;
					label-mounted = "%mountpoint% %percentage_used%%";
					label-warn = "%mountpoint% WARN";
					format-warn = "<label-warn>";
					format-warn-foreground = alert-color;
				};
				"module/cpu" = {
					type = "internal/cpu";
					interval = 5;
					label = "CPU %percentage%%";
					warn-percentage = 90;
					label-warn = "CPU %percentage%% WARN";
					format-warn-foreground = alert-color;
					format-warn = "<label-warn>";
				};
				"module/memory" = {
					type = "internal/memory";
					interval = 5;
					warn-percentage = 90;
					format-warn = "<label-warn>";
					label-warn = "RAM %gb_used%/%gb_total% (%percentage_used%%) WARN";
					format-warn-foreground = alert-color;
					label = "RAM %gb_used%/%gb_total% (%percentage_used%%)";
				};
				"module/pipewire" = {
					type = "custom/script";
					label = "%output%";
					#label-font = 2;
					interval = "2.0";
					exec = "~/.config/polybar/pipewire.sh";
					click-right = "exec /run/current-system/sw/bin/pavucontrol &";
					click-left = "~/.config/polybar/pipewire.sh mute &";
					scroll-up = "~/.config/polybar/pipewire.sh up &";
					scroll-down = "~/.config/polybar/pipewire.sh down &";
				};
				"module/title" = {
					type = "internal/xwindow";
				};
			};
		};
	};
}
