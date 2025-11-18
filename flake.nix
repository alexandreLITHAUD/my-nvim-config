{
  description = "Flake for my Neovim configuration";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-25.05";
    flake-utils.url = "github:numtide/flake-utils";
  };

  outputs = { self, nixpkgs, flake-utils, ... }:
    flake-utils.lib.eachDefaultSystem (system:
      let
        pkgs = import nixpkgs {
          inherit system;
        };
      in {
        devShells.default = pkgs.mkShell {
          buildInputs = with pkgs; [
            neovim
            python314
            go
            unzip
            ripgrep
            fd
            curl
            git
            nodejs
            lua
            gcc
            rustc
            cargo
            terraform
          ];

          shellHook = ''
            echo "Neovim environment is ready. Launch with: nvim"
          '';
        };
      });
}
