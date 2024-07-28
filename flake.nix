{
  description = "system flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";

    darwin = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    nixos-wsl = {
      url = "github:nix-community/nixos-wsl";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = inputs @ {
    self,
    nix-darwin,
    nixpkgs,
    home-manager,
    nixos-wsl,
    ...
  }: {
    ##### Nix Darwin Setup ####i
    # Initial Build with:
    # $ darwin-rebuild switch --flake .#Nicks-MacBook-Pro --experimental-features 'nix-command flakes'
    # Rebuild darwin flake using:
    # $ darwin-rebuild switch --flake .#Nicks-MacBook-Pro
    darwinConfigurations."Nicks-MacBook-Pro" = nix-darwin.lib.darwinSystem {
      modules = [
        ./Systems/Nicks-MacBook-Pro/darwin-configuration.nix
        home-manager.darwinModules.home-manager
        {
          home-manager.useGlobalPkgs = true;
          home-manager.useUserPackages = true;
          home-manager.users.nick = import ./Systems/Nicks-MacBook-Pro/home.nix;

          # Optionally, use home-manager.extraSpecialArgs to pass
          # arguments to home.nix
        }
      ];
    };

    # Expose the package set, including overlays, for convenience.
    # darwinPackages = self.darwinConfigurations."Nicks-MacBook-Pro".pkgs;

    ##### NixOS WSL setup ####
    # Initial Build with:
    # $ sudo nixos-rebuild switch --flake .#WSL
    # Build flake using:
    # $ sudo nixos-rebuild switch --flake .#WSL
    nixosConfigurations."WSL" = nixpkgs.lib.nixosSystem {
      # Note that you cannot put arbitrary configuration here: the configuration must be placed in the files loaded via modules
      system = "x86_64-linux";
      modules = [
        ./Systems/WSL/configuration.nix
        nixos-wsl.nixosModules.wsl
        home-manager.nixosModules.home-manager
        {
          home-manager.useGlobalPkgs = true;
          home-manager.useUserPackages = true;
          home-manager.users.nixos = import ./Systems/WSL/home.nix;

          # Optionally, use home-manager.extraSpecialArgs to pass
          # arguments to home.nix
        }
      ];
    };
  };
}
