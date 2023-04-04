{ 
  stdenv,
  nim,
  pkgsCross,
  ...
}:

stdenv.mkDerivation {
  pname = "as1Parser";
  version = "v0.0.1";
  src = ./src;

  shellHook = ''
    echo "\"amd64.windows.gcc.path = /nix/store/dwzwjh68m86c8w8zfmkyws3cacankbdf-x86_64-w64-mingw32-stage-final-gcc-wrapper-12.2.0/bin\"" > nim.cfg 
  '';

  buildInputs = [ nim pkgsCross.mingwW64.buildPackages.gcc ];
  buildPhase = ''
    export HOME=$(pwd)
    nim c -d:mingw --os:Windows main.nim
  '';

  installPhase = ''
    mkdir -p $out/bin
    mv main $out/bin/as1Parser
  '';
}