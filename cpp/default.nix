{
  name,
  stdenv,
  cmake,
  ...
}:
stdenv.mkDerivation rec {
  pname = name;
  version = "0.0.0";

  src = ./.;

  buildInputs = [cmake];

  dontUnpack = true;

  configurePhase = ''
    cmake -S $src -B .
  '';

  installPhase = ''
    mkdir -p $out/bin
    cp ${name} $out/bin
  '';
}
