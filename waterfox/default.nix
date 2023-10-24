{ pkgs ? import <nixpkgs> { system = builtins.currentSystem; }
, lib ? pkgs.lib
, stdenv ? pkgs.stdenv
, fetchurl ? pkgs.fetchurl
, makeWrapper ? pkgs.makeWrapper

, alsaLib ? pkgs.alsaLib
, at-spi2-atk ? pkgs.at-spi2-atk
, atk ? pkgs.atk
, cairo ? pkgs.cairo
, cups ? pkgs.cups
, curl ? pkgs.curl
, dbus-glib ? pkgs.dbus-glib
#, dbus_libs ? pkgs.dbus.libs
, fontconfig ? pkgs.fontconfig
, freetype ? pkgs.freetype
, gdk-pixbuf ? pkgs.gdk-pixbuf
, glib ? pkgs.glib
, glibc ? pkgs.glibc
# , gst-plugins-base ? pkgs.gst-plugins-base
# , gstreamer ? pkgs.gstreamer
, gtk2 ? pkgs.gtk2
, gtk3 ? pkgs.gtk3
, kerberos ? pkgs.kerberos
, libX11 ? pkgs.xorg.libX11
# , libXScrnSaver ? pkgs.libXScrnSaver
# , libXcomposite ? pkgs.libXcomposite
# , libXdamage ? pkgs.libXdamage
# , libXext ? pkgs.libXext
# , libXfixes ? pkgs.libXfixes
# , libXinerama ? pkgs.libXinerama
# , libXrender ? pkgs.libXrender
# , libXt ? pkgs.libXt
, libXtst ? pkgs.xorg.libXtst
, libcanberra_gtk2 ? pkgs.libcanberra-gtk2
, mesa ? pkgs.mesa
, nspr ? pkgs.nspr
, nss ? pkgs.nss
, pango ? pkgs.pango
, writeScript ? pkgs.writeScript
, xidel ? pkgs.xidel
, coreutils ? pkgs.coreutils
, gnused ? pkgs.gnused
, gnugrep ? pkgs.gnugrep
, gnupg ? pkgs.gnupg
}:

with lib;

let
  # Upstream source
  version = "G6.0.5";

  srcs = {
    "x86_64-linux" = fetchurl {
    url = "https://cdn1.waterfox.net/waterfox/releases/${version}/Linux_x86_64/waterfox-${version}.tar.bz2";
    sha256 = "01jmmk1ryq89fynknbvpfn28yhwq6dz0zywwh8jkqnb0fvrq67l1";

    };
  };
in

stdenv.mkDerivation rec {
  name = "waterfox-bin-${version}";
  inherit version;

  src = srcs."${stdenv.system}" or (throw "unsupported system: ${stdenv.system}");

  preferLocalBuild = true;
  allowSubstitutes = false;

  libPath = makeLibraryPath ([
    libXtst
    stdenv.cc.cc
    alsaLib
    at-spi2-atk
    atk
    cairo
    cups
    curl
    dbus-glib
    # dbus_libs
    fontconfig
    freetype
    gdk-pixbuf
    glib
    glibc
    # gst-plugins-base
    # gstreamer
    gtk2
    gtk3
    kerberos
    libX11
    # libXScrnSaver
    # libXcomposite
    # libXdamage
    # libXext
    # libXfixes
    # libXinerama
    # libXrender
    # libXt
    libcanberra_gtk2
    mesa
    nspr
    nss
    pango
  ]);


  nativeBuildInputs = [ makeWrapper ];

  buildCommand = ''
    mkdir -p "$prefix/opt/waterfox-bin-${version}"
    tar -xf "${src}" -C "$prefix/opt/waterfox-bin-${version}" --strip-components=1
    mkdir -p "$out/bin"
    ln -s "$prefix/opt/waterfox-bin-${version}/waterfox" "$out/bin/"
    for executable in \
      waterfox waterfox-bin plugin-container updater
    do
      patchelf --set-interpreter "$(cat $NIX_CC/nix-support/dynamic-linker)" \
        "$prefix/opt/waterfox-bin-${version}/$executable"
    done
    wrapProgram "$out/bin/waterfox" \
      --argv0 "$out/bin/.waterfox-wrapped" \
      --set LD_LIBRARY_PATH "$libPath" \
      --prefix XDG_DATA_DIRS : "$GSETTINGS_SCHEMAS_PATH:" \
      --suffix XDG_DATA_DIRS : "$XDG_ICON_DIRS"
  '';

  # meta = with stdenv.lib; {
  #   description = "A web browser (binary package)";
  #   homepage = https://www.waterfoxproject.org/;
  #   license = {
  #     free = false;
  #     url = https://www.waterfoxproject.org/terms;
  #   };
  #   maintainers = with stdenv.lib.maintainers; [ iamale ];
  #   platforms = platforms.linux;
  # };
}