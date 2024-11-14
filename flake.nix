{
  description = "My personal website";
  inputs.nixpkgs.url = "github:NixOS/nixpkgs/nixos-23.05";
  inputs.flake-utils.url = "github:numtide/flake-utils";

  outputs = { self, nixpkgs, flake-utils }:
    flake-utils.lib.eachDefaultSystem (system:
      let pkgs = nixpkgs.legacyPackages.${system};
      in {
        packages.website = pkgs.mkYarnPackage {
  name = "hello-purescript";
  src = ./.;
  packageJson = ./package.json;
  yarnLock = ./yarn.lock;
};

        defaultPackage = self.packages.${system}.website;
        devShells.default = pkgs.mkShell { packages = [ pkgs.hugo ]; };
      });
}