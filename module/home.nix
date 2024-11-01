{ pkgs, ... }: {
  # add home-manager user settings here
  home.stateVersion = "24.11";

  # Home Manager needs a bit of information about you and the paths it should
  # manage.
  # home.username = "forrest";
  # home.homeDirectory = "/Users/forrest";

  # This value determines the Home Manager release that your configuration is
  # compatible with. This helps avoid breakage when a new Home Manager release
  # introduces backwards incompatible changes.
  #
  # You should not change this value, even if you update Home Manager. If you do
  # want to update the value, then make sure to first check the Home Manager
  # release notes.
  # home.stateVersion = "24.05"; # Please read the comment before changing.
  # The home.packages option allows you to install Nix packages into your
  # environment.

  # nixpkgs = {
  #   config = {
  #     allowUnfree = true;
  #   };
  # };

  # home.packages = with pkgs; [ git neovim ];

  home.packages = [
    # pkgs.bitwarden-cli
    # pkgs.neovim
    pkgs.ansible
    pkgs.bottom
    pkgs.btop
    pkgs.coreutils
    pkgs.docker
    pkgs.doppler
    pkgs.fh
    pkgs.fx
    pkgs.git-lfs
    pkgs.glow
    pkgs.gnupg
    pkgs.gnutar
    pkgs.gnutls
    pkgs.go
    pkgs.grafana
    pkgs.grafana-agent
    pkgs.htop
    pkgs.just
    pkgs.kubectl
    pkgs.kubernetes-helm
    pkgs.lazydocker
    pkgs.minikube
    pkgs.neofetch
    pkgs.pipenv
    pkgs.python3
    pkgs.python312Packages.pip
    pkgs.redis
    pkgs.ripgrep
    pkgs.rustup
    pkgs.saml2aws
    pkgs.stow
    # pkgs.terraform
    pkgs.tfswitch
    pkgs.tgswitch
    # pkgs.terragrunt
    pkgs.tree
    pkgs.twitch-cli
    pkgs.wget
    pkgs.yq
    pkgs.zig
    pkgs.zoxide


    # # It is sometimes useful to fine-tune packages, for example, by applying
    # # overrides. You can do that directly here, just don't forget the
    # # parentheses. Maybe you want to install Nerd Fonts with a limited number of
    # # fonts?
    # (pkgs.nerdfonts.override { fonts = [ "FantasqueSansMono" ]; })

    # # You can also create simple shell scripts directly inside your
    # # configuration. For example, this adds a command 'my-hello' to your
    # # environment:
    # (pkgs.writeShellScriptBin "my-hello" ''
    #   echo "Hello, ${config.home.username}!"
    # '')
  ];

  # Home Manager is pretty good at managing dotfiles. The primary way to manage
  # plain files is through 'home.file'.
  home.file = {
    # # Building this configuration will create a copy of 'dotfiles/screenrc' in
    # # the Nix store. Activating the configuration will then make '~/.screenrc' a
    # # symlink to the Nix store copy.
    # ".screenrc".source = dotfiles/screenrc;

    # # You can also set the file content immediately.
    # ".gradle/gradle.properties".text = ''
    #   org.gradle.console=verbose
    #   org.gradle.daemon.idletimeout=3600000
    # '';
  };

  # Home Manager can also manage your environment variables through
  # 'home.sessionVariables'. These will be explicitly sourced when using a
  # shell provided by Home Manager. If you don't want to manage your shell
  # through Home Manager then you have to manually source 'hm-session-vars.sh'
  # located at either
  #
  #  ~/.nix-profile/etc/profile.d/hm-session-vars.sh
  #
  # or
  #
  #  ~/.local/state/nix/profiles/profile/etc/profile.d/hm-session-vars.sh
  #
  # or
  #
  #  /etc/profiles/per-user/forrest/etc/profile.d/hm-session-vars.sh
  #
  home.sessionVariables = {
    EDITOR = "nvim";
  };

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
  programs.git = {
    enable = true;

    userName = "Forrest Miller";
    userEmail = "forrestmillerj@gmail.com";

    aliases = {
      ga = "git add";
      gs = "git status";
      gc = "git commit";
      gl = "git log";
      gd = "git diff";
    };

    extraConfig = {
      core.editor = "nvim";
      core.autocrlf = "input";

      pull.rebase = "true";
      pull.default = "simple";

      push.autoSetupRemote = "true";

      color.ui = "auto";
    };

  };

  programs.bat = {
    enable = true;
    config = {
      theme = "Catppuccin Mocha";
    };
  };
  programs.awscli.enable = true;
  programs.bash = {
    enable = true;
    # being handled in .zshrc currently
    # sessionVariables = {
    #   CARGO_HOME = "$HOME/.cargo/env";
    # };
  };
  programs.fzf.enable = true;
  programs.k9s.enable = true;

  programs.jq.enable = true;

  programs.gh.enable = true;
  programs.lazygit.enable = true;
  programs.tmux = {
    enable = true;
    keyMode = "vi";
    baseIndex = 1;

    # fix for not loading zsh shell by default
    # https://github.com/nix-community/home-manager/issues/5952#issuecomment-2409056750
    extraConfig = ''
      set -gu default-command
      set -g default-shell "$SHELL"
    '';

    tmuxinator = {
      enable = true;
    };
  };
  programs.starship.enable = true;
}
