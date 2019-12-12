version:
{stdenv, fetchgit, perl}:
stdenv.mkDerivation rec {
    name = "MoarVM-${version}";
    inherit version;
    src = fetchgit {
        url    = "https://github.com/MoarVM/MoarVM.git";
        rev    = version;
        sha256 = "1nkbzrhpspyxs68zip24f98g2yqz5v3znhxrykzp3ll1772ndb32";
    };
    buildInputs = [perl];
    configureScript = "perl ./Configure.pl";
    configureFlags = [];
}
