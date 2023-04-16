{
  description = "Templates for projects in programming languages I use.";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs?ref=nixos-unstable";

    flake-utils.url = "github:numtide/flake-utils";
  };

  outputs = {
    self,
    nixpkgs,
    flake-utils,
    ...
  }:
    flake-utils.lib.eachsystem
    (let inherit (flake-utils.lib) system; in [system.aarch64-linux system.x86_64-linux]) (system: let
      pkgs = import nixpkgs {inherit system;};
    in {
      packages = {
        spicetify = pkgs.callpackage ./pkgs {};
        default = self.packages.${system}.spicetify;
      };

      formatter = pkgs.alejandra;
    });
}
