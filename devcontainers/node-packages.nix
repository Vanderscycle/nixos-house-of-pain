# This file has been generated by node2nix 1.11.1. Do not edit!

{nodeEnv, fetchurl, fetchgit, nix-gitignore, stdenv, lib, globalBuildInputs ? []}:

let
  sources = {};
in
{
  "@devcontainers/cli" = nodeEnv.buildNodePackage {
    name = "_at_devcontainers_slash_cli";
    packageName = "@devcontainers/cli";
    version = "0.52.1";
    src = fetchurl {
      url = "https://registry.npmjs.org/@devcontainers/cli/-/cli-0.52.1.tgz";
      sha512 = "sYK1cHHDVjdBIdxjMB8O668+qf0AAEJPMbeMR9ZTbUzXQBNke88vUOZ6DD9SjsqeE5es8SpWX6jV6gaItzJFyA==";
    };
    buildInputs = globalBuildInputs;
    meta = {
      description = "Dev Containers CLI";
      homepage = "https://github.com/devcontainers/cli#readme";
      license = "MIT";
    };
    production = true;
    bypassCache = true;
    reconstructLock = true;
  };
}
