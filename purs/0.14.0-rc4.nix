{ pkgs ? import <nixpkgs> {} }:

let
  version = "v0.14.0-rc4";

  src = if pkgs.stdenv.isDarwin
  then pkgs.fetchurl {
    url = "https://github.com/purescript/purescript/releases/download/v0.14.0-rc4/macos.tar.gz";
    sha256 = "0fw22n4i0plnlpj5l79ik6xmryy7bbaxr3iax6p5j1ywi6r3ysx5";
  }
  else pkgs.fetchurl {
    url = "https://github.com/purescript/purescript/releases/download/v0.14.0-rc4/linux64.tar.gz";
    sha256 = "0w8cifs26dbk193kivyznz1xf3rdnyld4yx8x0qj2cflzn3sy3c7";
  };

in
import ./mkPursDerivation.nix {
  inherit pkgs version src;
}
