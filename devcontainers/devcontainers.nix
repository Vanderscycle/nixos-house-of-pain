{ pkgs, ... }:

let
  nodeEnv = import ./node-env.nix {
    inherit (pkgs) pkgs lib stdenv nodejs python2 libtool runCommand writeTextFile writeShellScript;
  };
in
# line 478
nodeEnv.buildNodePackage {
  name = "devcontainers-cli";
  packageName = "devcontainers-cli";
  production = false; 
  # inherit (nodeEnv) globalBuildInputs;
  src = ./.;  # assuming this Nix expression is in the same directory as the generated files
}