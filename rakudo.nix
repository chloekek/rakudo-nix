version:
{stdenv, fetchgit, nqp, perl}:
stdenv.mkDerivation rec {
    name = "rakudo-${version}";
    inherit version;
    src = fetchgit {
        url    = "https://github.com/rakudo/rakudo.git";
        rev    = version;
        sha256 = "1snqr39gyay4qnsk87w29bphk9bk1m313lz66zg6ldypv1hcd2pb";
    };
    buildInputs = [nqp perl];
    configureScript = "perl ./Configure.pl";
    configureFlags = [
        "--backends=moar"
        "--with-nqp=${nqp}/bin/nqp"
    ];
}
