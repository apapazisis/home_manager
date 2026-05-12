{ pkgs, ... }: 

let
    username = builtins.getEnv "USER";
in {
  home.username = "apo";
  home.homeDirectory = "/home/apo";
  home.stateVersion = "23.11";

  # Εδώ θα προσθέτουμε τα νέα αρχεία που φτιάχνουμε
  imports = [
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