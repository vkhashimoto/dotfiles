{

	description = "My first flake";

	inputs = {
		nixpkgs.url = "nixpkgs/nixos-23.11";
		home-manager.url = "github:nix-community/home-manager/release-23.11";
		home-manager.inputs.nixpkgs.follows = "nixpkgs";
	};

	outputs = {self, nixpkgs, home-manager, ...}: 
		let
				system = "x86_64-linux";
				lib = nixpkgs.lib;
				pkgs = nixpkgs.legacyPackages.${system};
		in	{
		nixosConfigurations = {
				maindev = lib.nixosSystem {
						inherit system;
						modules = [ ./configuration.nix ];

				};
		};

		homeConfigurations = {
				vkhashimoto = home-manager.lib.homeManagerConfiguration {
						inherit pkgs;
						modules = [ ./home.nix ];

				};
		};
	};

}
