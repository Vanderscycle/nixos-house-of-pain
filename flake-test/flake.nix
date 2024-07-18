{
  description = "A very basic flake calling scripts";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    nix-scripts.url = "github:Vanderscycle/nixScripts";
  };

  outputs =
    {
      self,
      nixpkgs,
      nix-scripts,
      ...
    }:
    let
      system = "x86_64-linux";
      pkgs = nixpkgs.legacyPackages.${system};
      script_pkgs = nix-scripts.packages.${system};
    in
    {
      packages.${system} = {
        helloGo = script_pkgs.helloGo;
        hello = pkgs.hello;
      };
    };
}
