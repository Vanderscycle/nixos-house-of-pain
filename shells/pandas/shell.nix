{ pkgs ? import <nixpkgs> {} }:

pkgs.mkShell {
  buildInputs = [
    pkgs.python310
    pkgs.python310Packages.pandas
    pkgs.python310Packages.boto3
    pkgs.python310Packages.numpy
  ];

  shellHook = ''
    echo "Python environment with pandas is ready."
  '';
}
