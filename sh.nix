{ config, lib, pkgs, ... }:

{
	programs.bash = {
		enable = true;
		shellAliases = {
			gs = "git status";
		};
		bashrcExtra = ''
function gd() {
    if [ ! -f $1 ]; then
        git diff $(find . -name $1)
    else
        git diff $1
    fi
}
		'';
	};
}
