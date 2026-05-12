{
  description = "My Modular Nix Configuration";

  # Τα Inputs είναι οι εξωτερικές πηγές από τις οποίες το Flake σου αντλεί κώδικα και πακέτα.
  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixpkgs-unstable";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  # Τα Outputs είναι το τελικό αποτέλεσμα που παράγει το Flake σου, ορίζοντας πώς οι πηγές (Inputs) μετατρέπονται σε συγκεκριμένες ρυθμίσεις, πακέτα ή περιβάλλοντα χρήστη
  outputs = { nixpkgs, home-manager, ... }:
    let
      username = builtins.getEnv "USER";
      system = builtins.currentSystem;
      pkgs = nixpkgs.legacyPackages.${system};
    in {
      homeConfigurations.${username} = home-manager.lib.homeManagerConfiguration {
        inherit pkgs;
        modules = [ ./home.nix ];
      };
    };
}