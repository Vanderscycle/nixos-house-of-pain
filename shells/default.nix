{ pkgs ? import <nixpkgs> {} }:

pkgs.mkShell {
  buildInputs = [
    pkgs.gcc
    pkgs.cmake
    pkgs.sqlite # Assuming you also need SQLite
    # Add other dependencies here
  ];
}
