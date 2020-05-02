{ stdenv , fetchFromGitLab , gnome3 , gnome-doc-utils , gettext , pkg-config , glib }:

stdenv.mkDerivation rec {
  pname = "gnome-shell-extension-openweather";
  version = "unstable-2020-04-03";

  src = fetchFromGitLab {
    owner = "jenslody";
    repo = "gnome-shell-extension-openweather";
    rev = "d9a90d38439d81544ce7d1307ea74f16f2d8cb72";
    sha256 = "11f735whrzkyn6d3d7n19ycd6sfn6c3nyqlg3qjbjz0y7cfiw9rr";
  };

  uuid = "openweather-extension@jenslody.de";

  nativeBuildInputs = [
    gnome3.gnome-common
    gnome-doc-utils
    gettext
    pkg-config
    glib
  ];

  preConfigure = ''./autogen.sh'';

  postFixup = ''
    cp -r $out/share/gsettings-schemas/$pname-$version/glib-2.0/schemas/ \
      $out/share/gnome-shell/extensions/$uuid/
  '';

  meta = with stdenv.lib; {
    description = "A simple extension for displaying weather informations from several cities in GNOME Shell";
    license = licenses.gpl3;
    maintainers = with maintainers; [ firmero ];
    homepage = "https://gitlab.com/jenslody/gnome-shell-extension-openweather";
  };
}
