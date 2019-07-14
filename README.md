# rakudo-nix

Hopefully up-to-date Nix packages for Rakudo on MoarVM. SEE BELOW FOR
TROUBLESHOOTING NOTES.

To use this, apply the Nixpkgs configuration in figure 1. When building, Nix
will tell you the correct SHA-256 hash, which you must substitute for the
fake one.

```nix
let
    version = /* Rakudo version of choice, e.g. "2019.03" */;
    rakudo-nix = fetchTarball {
        url = "https://github.com/chloekek/rakudo-nix/archive/${version}.tar.gz";
        sha256 = "0000000000000000000000000000000000000000000000000000000000000000";
    };
    config = {
        packageOverrides = import rakudo-nix;
    };
in
    import <nixpkgs> {config = config;}
```

## IMPORTANT TROUBLESHOOTING NOTES

THESE NIX PACKAGES ARE NOT FOR RAKUDO STAR. IF YOU ARE LOOKING FOR RAKUDO
STAR YOU NEED TO LOOK ELSEWHERE.

ONLY MOARVM IS SUPPORTED. RAKUDO AND NQP ARE NOT BUILT FOR JVM AND NODE.JS.

How to configure Nixpkgs is documented in the Nixpkgs documentation.
Documenting it here is hopeless since everybody has a different workflow.

If you already have package overrides, you must merge these with yours. For
example:

```nix
{
    packageOverrides = pkgs:
        { /* your package overrides */ } //
        import rakudo-nix pkgs;
}
```

Why not Nixpkgs overlays? The documentation about them is poor and I couldn't
get them to work. If you know how they work, please send a patch. :)
