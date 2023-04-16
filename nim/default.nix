{
  name,
  nimRelease ? true,
  nimPackages,
  upx,
  binutils,
  ...
}: let
  nimFlags = ["--threads:on" "-d:release"];
  pname = name;
in
  nimPackages.buildNimPackage {
    inherit pname;
    version = "0.0.1";
    src = ./.;

    nimBinOnly = false;
    nimbleFile = ./${name}.nimble;
    inherit nimRelease nimFlags;

    nativeBuildInputs = [
      upx
      binutils
    ];

    # nim dependencies go here
    buildInputs = with nimPackages; [];

    postFixup = ''
      strip -s $out/bin/${pname}
      upx --best $out/bin/${pname}
    '';
  }
