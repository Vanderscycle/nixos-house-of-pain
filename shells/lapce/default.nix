let
  # Import the unstable channel
  unstable = import <nixpkgs-unstable> {};

in with unstable;
  mkShell {
    buildInputs = [ lapce ];
    # Include other dependencies or shell hooks if needed
  }
