{
  description = "A generic nim package";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs?ref=nixos-22.11";

    flake-utils.url = "github:numtide/flake-utils";
  };

  outputs = {
    self,
    nixpkgs,
    flake-utils,
    ...
  }: let
    supportedSystems = let
      inherit (flake-utils.lib) system;
    in [
      system.aarch64-linux
      system.x86_64-linux
    ];
  in
    flake-utils.lib.eachsystem supportedSystems (system: let
      pkgs = import nixpkgs {inherit system;};
    in {
      packages = {
        genericPackage = pkgs.callpackage ./. {name = "generic";};
        default = self.packages.${system}.genericPackage;
      };

      formatter = pkgs.alejandra;
    });
}
