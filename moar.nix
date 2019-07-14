version:
{stdenv, fetchurl, perl}:
stdenv.mkDerivation rec {
    name = "MoarVM-${version}";
    inherit version;
    src = fetchurl {
        url    = "https://moarvm.org/releases/${name}.tar.gz";
        sha256 = "017w1zvr6yl0cgjfc1b3ddlc6vjw9q8p7alw1vvsckw95190xc14";
    };
    buildInputs = [perl];
    configureScript = "perl ./Configure.pl";
    configureFlags = [];
}
