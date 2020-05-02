{ stdenv, fetchFromGitHub }:

stdenv.mkDerivation rec {
  pname = "gnome-shell-extension-disable-workspace-switcher-popup";
  version = "unstable-2020-01-08";

  src = fetchFromGitHub {
    owner = "windsorschmidt";
    repo = "disable-workspace-switcher-popup";
    rev = "b98d4bed1afac70e30d023b3835ebd6ac53a0581";
    sha256 = "029vmw3sj0szz4g3ygpw6cmzn0v2qdas158by0ribfyz57f6rr22";
  };

  uuid = "disable-workspace-switcher-popup@github.com";

  installPhase = ''
    mkdir -p $out/share/gnome-shell/extensions/$uuid
    cp metadata.json extension.js $out/share/gnome-shell/extensions/$uuid
  '';

  meta = with stdenv.lib; {
    description = "Gnome Shell 3 extension that disables the arrow displayed during workspace switching";
    license = licenses.unfree;
    maintainers = with maintainers; [ firmero ];
    homepage = "https://github.com/windsorschmidt/disable-workspace-switcher-popup";
  };
}
