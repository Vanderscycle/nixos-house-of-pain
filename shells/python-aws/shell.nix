{ pkgs ? import <nixpkgs> {} }:

pkgs.mkShell {
  buildInputs = with pkgs; [
    python311
    python311Packages.pyyaml
    python311Packages.boto3
    awscli
  ];

  shellHook = ''
    echo "Python environment with YAML and boto3 is ready."
    export AWS_PROFILE='henri-prd'
  '';
}
