{ pkgs ? import <nixpkgs> { system = builtins.currentSystem; }
, stdenv ? pkgs.stdenv
, fetchurl ? pkgs.fetchurl
}:
stdenv.mkDerivation rec {
  pname = "waterfox";
  version = "G6.0.5";

  src = fetchurl {
    url = "https://cdn1.waterfox.net/waterfox/releases/${version}/Linux_x86_64/waterfox-${version}.tar.bz2";
    sha256 = "01jmmk1ryq89fynknbvpfn28yhwq6dz0zywwh8jkqnb0fvrq67l1";
  };

  phases = [ "unpackPhase" "installPhase" ];

  installPhase = ''
    mkdir -p $out
    cp -R * $out/
  '';
}