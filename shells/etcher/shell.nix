{ pkgs ? import <nixpkgs> {
    config = {
      allowUnfree = true;
      permittedInsecurePackages = [ "electron-12.2.3" ];
    };
  }
}:

pkgs.mkShell {
  buildInputs = [
    pkgs.etcher
  ];
}