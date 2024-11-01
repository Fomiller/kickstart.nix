{
  description = "Example kickstart Nix on macOS environment.";

  inputs = {
    darwin.inputs.nixpkgs.follows = "nixpkgs";
    darwin.url = "github:lnl7/nix-darwin";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";
    home-manager.url = "github:nix-community/home-manager";
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
  };

  outputs =
    inputs @ { self
    , darwin
    , home-manager
    , nixpkgs
    , ...
    }:
    let
      darwin-system = import ./system/darwin.nix { inherit inputs username; };
      username = "forrest"; # TODO: replace with user name and remove throw
    in
    {
      # darwin-system.stateVersion = 5;
      darwinConfigurations = {
        aarch64 = darwin-system "aarch64-darwin";
        x86_64 = darwin-system "x86_64-darwin";
      };
    };
}
