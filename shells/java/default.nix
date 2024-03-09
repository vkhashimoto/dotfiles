{ version ? 21 }:
let 
	pkgs = import <nixpkgs> {};
	versions = {
		v11 = pkgs.jdk11;
		v17 = pkgs.jdk17;
		v21 = pkgs.jdk21;
	};
in pkgs.mkShell {
	packages = [
		versions."v${version}"
		pkgs.maven
	];

	shellHook = ''
		echo "|-----------------------|"
		echo "|Java ${toString version} Dev Environment|"
		echo "|-----------------------|"
		java --version
	'';
}

