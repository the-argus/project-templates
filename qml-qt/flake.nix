{
  description = "QML Example Project";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs?ref=nixos-unstable";
    flake-utils.url = "github:numtide/flake-utils";
  };

  outputs = {
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
    flake-utils.lib.eachSystem supportedSystems (system: let
      pkgs = import nixpkgs {inherit system;};
    in {
      devShell = let
        qtPackages = with pkgs.qt6; [
          qt6.qtbase
          qt6.qtdeclarative
          qt6.qt5compat
        ];
      in
        pkgs.mkShell
        {
          packages = with pkgs;
            [
              # build tools
              qt6.qmake
              gnumake
              cmake
            ]
            ++ qtPackages;

          shellHook = ''
            for pkg in ${builtins.concatStringsSep " " (map (pkg: "\"${pkg}\"") qtPackages)}; do
              local pluginDir="$pkg/lib/qt-6/plugins"
              if [ -d "$pluginDir" ]; then
                export QT_PLUGIN_PATH="$pluginDir:$QT_PLUGIN_PATH"
              fi

              local qmlDir="$pkg/lib/qt-6/qml"
              if [ -d "$qmlDir" ]; then
                export QML2_IMPORT_PATH="$qmlDir:$QML2_IMPORT_PATH"
              fi
            done
          '';
        };

      formatter = pkgs.alejandra;
    });
}
