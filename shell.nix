{ sources ? import ./nix/sources.nix, pkgs ? import sources.nixpkgs {}}:

let

  mypython = pkgs.python310.buildEnv.override {
    extraLibs = with pkgs.python310Packages; [
      pelican
      ghp-import
    ];
  };

in

  pkgs.mkShell {
      buildInputs = with pkgs; [
          mypython
      ];
  }
