{

	description = "My first flake";

	inputs = {
		nixpkgs.url = "nixpkgs/nixos-23.11";
		nixpkgs-unstable.url = "nixpkgs/nixos-unstable";
		home-manager.url = "github:nix-community/home-manager/release-23.11";
		home-manager.inputs.nixpkgs.follows = "nixpkgs";
	};

	outputs = {self, nixpkgs, nixpkgs-unstable, home-manager, ...}: 
		let
				system = "x86_64-linux";
				lib = nixpkgs.lib;
				pkgs = nixpkgs.legacyPackages.${system};
				pkgs-unstable = nixpkgs-unstable.legacyPackages.${system};
		in	{
		nixosConfigurations = {
				maindev = lib.nixosSystem {
						inherit system;
						modules = [ ./configuration.nix ];

				};
		};

		homeConfigurations = {
				vkhashimoto = home-manager.lib.homeManagerConfiguration {
						#inherit pkgs;
						#TODO: Use predicate
						pkgs = import nixpkgs {
							inherit system;
							config.allowUnfree = true;
						};
						modules = [ ./home.nix ];
						extraSpecialArgs = {
							inherit pkgs-unstable;
						};

				};
		};
	};

}
