{
  pkgs ? import <nixpkgs> { },
}:
pkgs.mkShell {
  # desired packages 
  nativeBuildInputs = with pkgs; [
  ];

  shellHook = ''
    ${pkgs.neofetch}/bin/neofetch
    if [ -f .env ]; then export $(xargs <.env); fi
    echo -e "You are now in a dev shell in $(pwd)" | ${pkgs.lolcat}/bin/lolcat 
  '';

}
