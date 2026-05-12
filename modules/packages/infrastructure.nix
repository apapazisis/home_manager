{ pkgs, ... }:

{
  home.packages = with pkgs; [
    # Infrastructure as Code tools
    terraform
    opentofu

    # Cloud provider CLIs
    awscli2
  ];
}