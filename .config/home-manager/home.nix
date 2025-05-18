{ config, pkgs, ... }:

{
  home = {
    username = "user";
    homeDirectory = "/home/user";
    stateVersion = "25.11";
    enableNixpkgsReleaseCheck = false;
    packages = with pkgs; [
      starship # prompt
      fish # shell
      direnv # environment variable manager
      fzf # fuzzy finder
      vim
      helix
      curl
      wget
      zellij # terminal multiplexer
      lazygit # git tui
      jq # json processor
      ripgrep # search tool
      bat # cat replacement
      fd # find replacement
      eza # ls replacement
      git # version control
      # gh install locally if needed (security risk)

      # dev tools
      nvme-cli # nvme cli
    ];
    file = {
    };
    sessionVariables = {
    };
  };
  programs = {
    home-manager.enable = true;
    git = {
      enable = true;
      userName = "wipeseals";
      userEmail = "wipeseals@gmail.com";
    };
    starship = {
      enable = true;
    };
    fish = {
      enable = true;
      interactiveShellInit = ''
        set fish_greeting ""
        starship init fish | source
        fzf --fish | source
      '';
    };
    direnv = {
      enable = true;
      nix-direnv.enable = true;
    };
  };
}
