{
  description = "Laggy World website";

  outputs = { nixpkgs, ... }:
    let
      pkgs = nixpkgs.legacyPackages.x86_64-linux;
    in {
      packages.x86_64-linux.default = pkgs.stdenv.mkDerivation {
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
