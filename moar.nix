version:
{stdenv, fetchgit, perl}:
stdenv.mkDerivation rec {
    name = "MoarVM-${version}";
    inherit version;
    src = fetchgit {
        url    = "https://github.com/MoarVM/MoarVM.git";
        rev    = version;
        sha256 = "19hfgvx3bhs2vb0x6fggfgz69nbf5f8742s73cscbnywj4n860j1";
    };
    buildInputs = [perl];
    configureScript = "perl ./Configure.pl";
    configureFlags = [];
}
