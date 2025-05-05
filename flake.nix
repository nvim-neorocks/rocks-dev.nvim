{
  description = "Rocks development module for rocks.nvim";

  nixConfig = {
    extra-substituters = "https://neorocks.cachix.org";
    extra-trusted-public-keys = "neorocks.cachix.org-1:WqMESxmVTOJX7qoBC54TwrMMoVI1xAM+7yFin8NRfwk=";
  };

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs";

    rocks-nvim-flake = {
      url = "github:nvim-neorocks/rocks.nvim";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    neorocks.url = "github:nvim-neorocks/neorocks";

    gen-luarc.url = "github:mrcjkb/nix-gen-luarc-json";

    flake-parts.url = "github:hercules-ci/flake-parts";

    git-hooks = {
      url = "github:cachix/git-hooks.nix";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = inputs @ {
    self,
    nixpkgs,
    rocks-nvim-flake,
    neorocks,
    gen-luarc,
    flake-parts,
    git-hooks,
    ...
  }:
    flake-parts.lib.mkFlake {inherit inputs;} {
      systems = [
        "x86_64-linux"
        "x86_64-darwin"
        "aarch64-darwin"
      ];
      perSystem = {
        config,
        self',
        inputs',
        system,
        ...
      }: let
        pkgs = import nixpkgs {
          inherit system;
          overlays = [
            neorocks.overlays.default
            gen-luarc.overlays.default
            rocks-nvim-flake.overlays.default
            self.overlays.default
          ];
        };

        luarc = pkgs.mk-luarc {
          nvim = pkgs.neovim-nightly;
          plugins = with pkgs.lua51Packages; [
            inputs.rocks-nvim-flake.packages.${pkgs.system}.rocks-nvim
            nvim-nio
          ];
          disabled-diagnostics = [
            # caused by a nio luaCATS bug
            "redundant-return-value"
          ];
        };

        type-check-nightly = git-hooks.lib.${system}.run {
          src = self;
          hooks = {
            lua-ls = {
              enable = true;
              settings.configuration = luarc;
            };
          };
        };

        git-hooks-check = git-hooks.lib.${system}.run {
          src = self;
          hooks = {
            alejandra.enable = true;
            stylua.enable = true;
            luacheck.enable = true;
            editorconfig-checker.enable = true;
            panvimdoc = {
              enable = true;
              name = "panvimdoc";
              entry = "${pkgs.panvimdoc}/bin/panvimdoc --project-name rocks-dev.nvim --toc false --treesitter true --demojify true --input-file";
              files = "README.md";
            };
          };
        };

        devShell = pkgs.integration-nightly.overrideAttrs (oa: {
          name = "rocks-dev.nvim devShell";
          shellHook = ''
            ${git-hooks-check.shellHook}
            ln -fs ${pkgs.luarc-to-json luarc} .luarc.json
          '';
          buildInputs =
            self.checks.${system}.git-hooks-check.enabledPackages
            ++ (with pkgs; [
              lua-language-server
            ])
            ++ oa.buildInputs
            ++ oa.propagatedBuildInputs;
          doCheck = false;
        });
      in {
        devShells = {
          default = devShell;
          inherit devShell;
        };

        packages = rec {
          inherit (pkgs) rocks-dev-nvim neovim-with-rocks;
          default = rocks-dev-nvim;
        };

        checks = {
          inherit
            git-hooks-check
            type-check-nightly
            ;
          inherit
            (pkgs)
            integration-nightly
            integration-stable
            ;
        };
      };
      flake = {
        overlays.default = import ./nix/overlay.nix {inherit self rocks-nvim-flake;};
      };
    };
}
