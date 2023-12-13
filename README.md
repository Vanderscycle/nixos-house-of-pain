# NixOs House Of Pain

`Would it be the NixOS experience if I gave you all the answers in one, convenient place?` -hlissner

The way of NixOs is the way of pain and self-hatred. Don't bother asking for help, this pain is yours to enjoy.


## Programs
- [Waterfox](./waterfox)
- [Devcontainers-cli](./devcontainers)

## Shelss

To be used in conjonction of bash/fish command to source from anywhere

```
set -xg SHELL_FILE (find /home/henri/Documents/houseOfNixAndPain/shells -name 'shell.nix' | fzf)
nix-shell $SHELL_FILE 
```

### Lessons learned
- node2nix -i <input> -18 (don't forget the version) 
- the node-packages.json is not a carbon copy of a normal package.json but an array of js packages
- nix-shell -A @devcontainers/cli

## References 
- hlissner [doots](https://github.com/hlissner/dotfiles)