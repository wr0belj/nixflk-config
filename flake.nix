{
  description = "A simple NixOS config with flakes support.";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    home-manager.url = "github:nix-community/home-manager";
    inputs.nixos-hardware.url = github:NixOS/nixos-hardware/master;
  };

  outputs = inputs: 
  {
    nixosConfigurations = {
      supernaut = inputs.nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        modules = [
          ./hosts/supernaut/default.nix
          nixos-hardware.nixosModules.t460s
          home-manager.nixosModules.home-manager
          {
            home-manager.useGlobalPkgs = true;
            home-manager.useUserPackages = true;
            home-manager.users.wrobeljakub = import ./home/default.nix;
          }
        ];
        specialArgs = { inherit inputs; }
      };
    };
  };
}