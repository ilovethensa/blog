{
  description = "My personal website";
  inputs.nixpkgs.url = "github:NixOS/nixpkgs/nixos-23.05";
  inputs.flake-utils.url = "github:numtide/flake-utils";

  outputs = { self, nixpkgs, flake-utils }:
    flake-utils.lib.eachDefaultSystem (system:
      let pkgs = nixpkgs.legacyPackages.${system};
      in {
        packages.website = pkgs.buildNpmPackage rec {
  pname = "flood";
  version = "4.7.0";

  src = ./.;

  npmDepsHash = "sha256-tuEfyePwlOy2/mOPdXbqJskO6IowvAP4DWg8xSZwbJw=";

  # The prepack script runs the build script, which we'd rather do in the build phase.
  npmPackFlags = [ "--ignore-scripts" ];

  NODE_OPTIONS = "--openssl-legacy-provider";

  meta = {
    description = "Modern web UI for various torrent clients with a Node.js backend and React frontend";
    homepage = "https://flood.js.org";
    license = pkgs.lib.licenses.gpl3Plus;
    maintainers = with pkgs.lib.maintainers; [ winter ];
  };
};

        defaultPackage = self.packages.${system}.website;
        devShells.default = pkgs.mkShell { packages = [ pkgs.hugo ]; };
      });
}