{ pkgs ? import <nixpkgs> { } }:

let
  inherit (pkgs) stdenv;

in pkgs.mkShell {
  name = "latex-development-environment";
  buildInputs = with pkgs; [ texliveFull just watchexec mprocs ];
}