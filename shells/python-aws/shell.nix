{ pkgs ? import <nixpkgs> {} }:

pkgs.mkShell {
  buildInputs = [
    pkgs.python310
    pkgs.python310Packages.pyyaml
    pkgs.python310Packages.boto3
    pkgs.awscli
  ];

  shellHook = ''
    echo "Python environment with YAML and boto3 is ready."
    export AWS_PROFILE='henri-prd'
  '';
}