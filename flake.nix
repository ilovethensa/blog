{
  description = "A flake for developing and building my personal website";

  inputs.nixpkgs.url = "github:nixos/nixpkgs/nixpkgs-unstable";
  inputs.flake-utils.url = "github:numtide/flake-utils";

  outputs = {
    self,
    nixpkgs,
    flake-utils,
  }:
    flake-utils.lib.eachDefaultSystem (
      system: let
        pkgs = nixpkgs.legacyPackages.${system};
      in {
        packages.website = pkgs.stdenv.mkDerivation rec {
          pname = "static-website";
          version = "2021-11-19";
          src = ./.;
          offlineCache = pkgs.fetchYarnDeps {
            yarnLock = src + "/yarn.lock";
            hash = "....";
          };
          nativeBuildInputs = [pkgs.hugo pkgs.nodejs pkgs.yarn];
          buildPhase = "yarn --offline && hugo build";
          installPhase = "cp -r public $out";
        };
        defaultPackage = self.packages.${system}.website;
        devShell = pkgs.mkShell {
          packages = with pkgs; [
            hugo
            nodejs
            pkgs.yarn
          ];
        };
      }
    );
}
