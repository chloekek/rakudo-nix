version:
{stdenv, fetchgit, moar, perl}:
stdenv.mkDerivation rec {
    name = "nqp-${version}";
    inherit version;
    src = fetchgit {
        url    = "https://github.com/perl6/nqp.git";
        rev    = version;
        sha256 = "1v3i05ghk8i9y1ikjb6629hl5dg9f7hnkarc0vzpymlyij3077m5";
    };
    buildInputs = [moar perl];
    patches = [./0001-profile-template.patch];
    configureScript = "perl ./Configure.pl";
    configureFlags = [
        "--backends=moar"
        "--with-moar=${moar}/bin/moar"
    ];
}
