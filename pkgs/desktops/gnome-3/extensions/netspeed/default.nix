{ stdenv , fetchFromGitHub, glib }:

stdenv.mkDerivation rec {
  pname = "gnome-shell-extension-netspeed";
  version = "unstable-2020-03-23";

  src = fetchFromGitHub {
    owner = "hedayaty";
    repo = "NetSpeed";
    rev =  "9d7459967d3e38f9330e40b047db76013ea623f8";
    sha256 = "1psgcd2bc7yfykni9axqv3n1cg0ap4kqr90hivn0hw2kz37g22ik";
  };

  uuid = "netspeed@hedayaty.gmail.com";

  nativeBuildInputs = [ glib ];

  dontBuild = true;

  installPhase = ''
    glib-compile-schemas  schemas
    schemadir=${glib.makeSchemaPath "$out" "${pname}-${version}"}
    mkdir -p $schemadir
    cp -r schemas/* $schemadir

    mkdir -p $out/share/gnome-shell/extensions/$uuid
    cp -r * $out/share/gnome-shell/extensions/$uuid
  '';

  meta = with stdenv.lib; {
    description = "An extension for gnome 3 to show internet speed";
    license = licenses.gpl2;
    platforms = platforms.linux;
    homepage = "https://github.com/hedayaty/NetSpeed";
  };

}
