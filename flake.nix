{
  description = "Templates for projects in programming languages I use.";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs?ref=nixos-unstable";
  };

  outputs = {
    self,
    nixpkgs,
    ...
  }: let
    # just used for the formatter
    system = "x86_64-linux";
    pkgs = import nixpkgs {inherit system;};
  in {
    templates = {
      default = self.templates.nix;
      cpp = {
        path = ./cpp;
        description = "A basic CPP project using CMake.";
      };
      nix = {
        path = ./nix;
        description = "A nix flake meant to package one piece of software.";
      };
      nim = {
        path = ./nim;
        description = "A generic nim project which includes nix packaging.";
      };
    };

    formatter.${system} = pkgs.alejandra;
  };
}
