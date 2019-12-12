version:
{stdenv, fetchgit, nqp, perl}:
stdenv.mkDerivation rec {
    name = "rakudo-${version}";
    inherit version;
    src = fetchgit {
        url    = "https://github.com/rakudo/rakudo.git";
        rev    = version;
        sha256 = "17226ccmnv83lx9c2v6ilrad3dd00c4lrnxjs23k5dwli79bkjf0";
    };
    buildInputs = [nqp perl];
    configureScript = "perl ./Configure.pl";
    configureFlags = [
        "--backends=moar"
        "--with-nqp=${nqp}/bin/nqp"
    ];
}
