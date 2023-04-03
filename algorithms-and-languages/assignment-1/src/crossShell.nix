{ nixpkgs ? fetchTarball "https://github.com/NixOS/nixpkgs/archive/3364b5b117f65fe1ce65a3cdd5612a078a3b31e3.tar.gz"
, pkgs ? (import nixpkgs {}).pkgsCross.mingw32
}:

# callPackage is needed due to https://github.com/NixOS/nixpkgs/pull/126844
pkgs.pkgsStatic.callPackage ({ mkShell, nim, zlib, pkg-config, file }: mkShell {
  # these tools run on the build platform, but are configured to target the host platform
  nativeBuildInputs = [ pkg-config file ];
  # libraries needed for the host platform
  buildInputs = [ zlib nim ];
}) {}