{ pkgs, ... }: 

let
    username = builtins.getEnv "USER";
in {
  home.username = username;
  home.homeDirectory = "/home/apo";
  home.stateVersion = "23.11";

  nixpkgs.config.allowUnfree = true;

  # Εδώ θα προσθέτουμε τα νέα αρχεία που φτιάχνουμε
  imports = [
    ./modules/packages.nix
    ./modules/git.nix
  ];

  # Γενικά πακέτα που δεν θέλουν ρυθμίσεις
  home.packages = with pkgs; [
    htop
    fastfetch
    tree
  ];

  programs.home-manager.enable = true;
}