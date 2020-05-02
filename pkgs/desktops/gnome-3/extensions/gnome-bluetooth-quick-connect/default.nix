{ stdenv , fetchFromGitHub, glib }:

stdenv.mkDerivation rec {
  pname = "gnome-shell-extension-gnome-bluetooth-quick-connect";
  version = "10";

  src = fetchFromGitHub {
    owner = "bjarosze";
    repo = "gnome-bluetooth-quick-connect";
    rev =  "v${version}";
    sha256 = "0vfqxh4s8jyz2cf2dsy89f07a1lcrsk81kl2csgzqvi4xy8n6gp3";
  };

  uuid = "bluetooth-quick-connect@bjarosze.gmail.com";

  nativeBuildInputs = [ glib ];

  installPhase = ''
    mkdir -p $out/share/gnome-shell/extensions/$uuid
    cp -r * $out/share/gnome-shell/extensions/$uuid

    schemadir=${glib.makeSchemaPath "$out" "${pname}-${version}"}
    mkdir -p $schemadir
    cp -r schemas/* $schemadir
  '';

  meta = with stdenv.lib; {
    description = "Allow to connect bluetooth paired devices from gnome control panel";
    license = licenses.gpl3;
    maintainers = with maintainers; [ firmero ];
    homepage = "https://github.com/bjarosze/gnome-bluetooth-quick-connect";
  };
}
