{
  stdenvNoCC,
  fetchFromGitHub,
  ...
}:
stdenvNoCC.mkDerivation rec {
  pname = "unknown";
  version = "0.0.0";

  src = fetchFromGitHub {
    owner = "owner";
    repo = "repo";
    rev = version;
    sha256 = "";
  };
}
