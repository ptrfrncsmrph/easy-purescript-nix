{ pkgs ? import <nixpkgs> {} }:

let
  version = "v0.14.0-rc5";

  src = if pkgs.stdenv.isDarwin
  then pkgs.fetchurl {
    url = "https://github.com/purescript/purescript/releases/download/v0.14.0-rc5/macos.tar.gz";
    sha256 = "01j6js9zq0gqq4g958igpqz0z9fs1v9lb750ydsh5nsb68kjqm61";
  }
  else pkgs.fetchurl {
    url = "https://github.com/purescript/purescript/releases/download/v0.14.0-rc5/linux64.tar.gz";
    sha256 = "14cfl97dg0dqg4j7aa950bn9fp6ij12an13mf54mibalah9sv4f4";
  };

in
import ./mkPursDerivation.nix {
  inherit pkgs version src;
}
