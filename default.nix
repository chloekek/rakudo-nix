let version = "2020.02.1"; in
pkgs: {
    moar = pkgs.callPackage (import ./moar.nix version) {};
    nqp = pkgs.callPackage (import ./nqp.nix version) {};
    rakudo = pkgs.callPackage (import ./rakudo.nix version) {};
}
