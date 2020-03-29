version:
{stdenv, fetchgit, perl}:
stdenv.mkDerivation rec {
    name = "MoarVM-${version}";
    inherit version;
    src = fetchgit {
        url    = "https://github.com/MoarVM/MoarVM.git";
        rev    = version;
        sha256 = "1fj8ggi9cr52r7gpcicy7saph81w6v585z10y768d4jr1xqarwcb";
    };
    buildInputs = [perl];
    configureScript = "perl ./Configure.pl";
    configureFlags = [];
}
