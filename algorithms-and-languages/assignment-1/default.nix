{ stdenv, nim, ...}:

stdenv.mkDerivation {
  pname = "as1Parser";
  version = "v0.0.1";
  src = ./src;
  
  buildInputs = [ nim ];
  buildPhase = ''
    nim c main.nim
  '';

  installPhase = ''
    mkdir -p $out/bin
    mv main $out/bin/as1Parser
  '';
}