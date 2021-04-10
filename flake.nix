{
  description = "A simple NixOS config with flakes support.";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    home-manager.url = "github:nix-community/home-manager";
  };

  outputs = inputs: 
  with inputs; {
    nixosConfigurations = {
      supernaut = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        modules = [
          ./hosts/supernaut/default.nix
          home-manager.nixosModules.home-manager
          {
            home-manager.useGlobalPkgs = true;
            home-manager.useUserPackages = true;
            home-manager.users.wrobelj = import ./home/default.nix;
          }
        ];
        specialArgs = { inherit inputs; };
      };
    };
  };
}
