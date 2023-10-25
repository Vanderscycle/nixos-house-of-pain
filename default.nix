{ ... }:

# not quite working
#   waterfox = (import "${my-packages}/waterfox" { pkgs = pkgs; });
# TODO: make something more dynamic
{
  imports = [
    ./waterfox
  ];
}
