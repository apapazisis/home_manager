{ pkgs, ... }: {
  programs.git = {
    enable = true;
    # Χρησιμοποιούμε τη νέα σύνταξη για να φύγουν και τα warnings
    settings = {
      user = {
        name = "apo";
        email = "your@email.com";
      };
      init.defaultBranch = "main";
    };
  };
}