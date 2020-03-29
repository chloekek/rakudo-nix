version:
{stdenv, fetchgit, moar, perl}:
stdenv.mkDerivation rec {
    name = "nqp-${version}";
    inherit version;
    src = fetchgit {
        url    = "https://github.com/perl6/nqp.git";
        rev    = version;
        sha256 = "0hmp5ljsavnjplfmcxy656wjzap3ab2y232cwz90aq56pgv1gj3m";
    };
    buildInputs = [moar perl];
    configureScript = "perl ./Configure.pl";
    configureFlags = [
        "--backends=moar"
        "--with-moar=${moar}/bin/moar"
    ];
}
