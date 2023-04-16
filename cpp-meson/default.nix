{
  name,
  stdenv,
  meson,
  ninja,
  pkg-config,
  ...
}:
stdenv.mkDerivation rec {
  pname = name;
  version = "0.0.0";

  src = ./src;

  nativeBuildInputs = [
    pkg-config
    meson
    ninja
  ];
  configurePhase = ''
    meson setup builddir
  '';
  buildPhase = ''
    meson compile -C builddir
  '';
  installPhase = ''
    mkdir -p $out/bin
    mv builddir/${name} $out/bin/${name}
  '';
}
