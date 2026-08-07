{ inputs, pkgs, ... }:
{
  imports = [ inputs.mnw.homeManagerModules.default ];

  qt.enable = true;

  home.packages = with pkgs; [
    git
    ripgrep

    lua-language-server

    nixd

    typescript-language-server

    rust-analyzer
    cargo
    rustc

    gcc

    kdePackages.qtdeclarative
  ];

  programs.mnw = {
    enable = true;
    initLua = ''
      require("pyricConf")
    '';
    plugins = {
      start = with pkgs.vimPlugins; [
        # themes
        ayu-vim

        # plugins
        gitsigns-nvim
        nvim-lspconfig
        nvim-tree-lua
        blink-cmp
        telescope-nvim
        plenary-nvim
        which-key-nvim
        indent-blankline-nvim
        nvim-autopairs
        (nvim-treesitter.withPlugins (plugins: with plugins; [
          lua
          nix
          typescript
          javascript
          html
          css
          json
          markdown
          bash
          python
          c
          cpp
          rust
          qmljs
        ]))
      ];

      dev.pyricConf = {
        pure = ./nvim;
	      impure = "/' .. vim.uv.cwd() .. '/nvim";
      };
    };
  };
}
