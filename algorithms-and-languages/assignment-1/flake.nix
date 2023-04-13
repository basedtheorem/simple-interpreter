{
  description = "Parser/Interpreter";

  inputs = {
    nixpkgs.url = github:nixos/nixpkgs?ref=242246ee1e58f54d2322227fc5eef53b4a616a31;
  };

  outputs = { self, nixpkgs }:
    let
      system = "x86_64-linux";
      pkgs = import nixpkgs { inherit system; };
    in {
      packages.${system} = {
        as1Parser = pkgs.callPackage ./. {};
        default = self.packages.${system}.as1Parser;
      };
    };
}
