{
  packageOverrides = pkgs: with pkgs; {
    myPackages = pkgs.buildEnv {
      name = "my-packages";
      paths = [
        jq
        ripgrep
        fd
        tmux
        neovim
        git
        tig
        fzf
        ncdu
        autojump
        stow
        tldr
        ansible
        yt-dlp
        ansible-lint
        yamllint
        pipx
        hugo
        starship
        pipx
        drawio
        lazygit
        lazydocker
      ];
    };
  };
}
