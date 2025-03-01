{inputs, ...}: {
  modifications = final: _prev: {
    #emulationstation-de
    libgit2 = final.stable.libgit2;
    icu = final.stable.icu;

    #nix 2.24.12
    s2n-tls = final.stable.s2n-tls;
    aws-c-io = final.stable.aws-c-io;
    aws-c-s3 = final.stable.aws-c-s3;
  };

  nixpkgs-stable = final: _prev: {
    stable = import inputs.nixpkgs-stable {
      system = final.system;
      config.allowUnfree = true;
    };
  };
}
