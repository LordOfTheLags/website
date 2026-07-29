{
  description = "Laggy World website";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
  };

  outputs = { self, nixpkgs, ... }:
    let
      systemArch = "x86_64-linux"; 
      pkgs = nixpkgs.legacyPackages.${systemArch};
    in {
      packages.${systemArch}.default = pkgs.stdenv.mkDerivation {
        name = "website";
        src = ./.;
        nativeBuildInputs = [ pkgs.zola ];
        buildPhase = "zola build";
        installPhase = "cp -r public $out";
      };

      devShells.x86_64-linux.default = pkgs.mkShell {
        packages = [ pkgs.zola ];
      };
    };
}
