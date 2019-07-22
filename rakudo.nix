version:
{stdenv, fetchgit, nqp, perl}:
stdenv.mkDerivation rec {
    name = "rakudo-${version}";
    inherit version;
    src = fetchgit {
        url    = "https://github.com/rakudo/rakudo.git";
        rev    = version;
        sha256 = "0hgfl23zib9s0g6i4xrljvamqgi72sgfby1lhb2khwg492vsa4i6";
    };
    buildInputs = [nqp perl];
    configureScript = "perl ./Configure.pl";
    configureFlags = [
        "--backends=moar"
        "--with-nqp=${nqp}/bin/nqp"
    ];
}
