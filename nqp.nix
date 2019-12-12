version:
{stdenv, fetchgit, moar, perl}:
stdenv.mkDerivation rec {
    name = "nqp-${version}";
    inherit version;
    src = fetchgit {
        url    = "https://github.com/perl6/nqp.git";
        rev    = version;
        sha256 = "1p3v0hfzf6p9xpm5k895xh5fkz5x6w3c6bn8yvpb8im89zq3mmcc";
    };
    buildInputs = [moar perl];
    configureScript = "perl ./Configure.pl";
    configureFlags = [
        "--backends=moar"
        "--with-moar=${moar}/bin/moar"
    ];
}
