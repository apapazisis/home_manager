{ ... }: {
  programs.git = {
    enable = true;
    userName = "apo";
    userEmail = "apo@email.com";
    extraConfig = {
      init.defaultBranch = "main";
    };
  };
}