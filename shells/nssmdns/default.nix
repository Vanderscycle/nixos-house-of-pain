{ config, pkgs, ... }:

{
  # Ensure the environment system-wide has access to nss-mdns
  environment.systemPackages = with pkgs; [
    nssmdns
  ];

  # Enable Avahi daemon for mDNS support
  services.avahi = {
    enable = true;
    nssmdns = true; # Enable nss-mdns support in Avahi
  };

  # Configure network hostnames resolution to include mDNS
  networking = {
    # This option allows NixOS to manage /etc/nsswitch.conf
    # Ensure mDNS is used for hostname resolution
    hostName = "nixos-desktop"; # Set your desired hostname here
    useHostResolvConf = false;
    resolvConf = {
      localDomains = [ "local" ];
    };
  };
}
