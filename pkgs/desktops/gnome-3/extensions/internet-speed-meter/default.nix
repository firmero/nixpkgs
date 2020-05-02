{ stdenv , fetchFromGitLab }:

stdenv.mkDerivation rec {
  pname = "gnome-shell-extension-internet-speed-meter";
  version = "2";

  src = fetchFromGitLab {
    owner = "AlShakib";
    repo = "InternetSpeedMeter";
    rev =  version;
    sha256 = "0lnql6jm4z311faxxqrf0sx9vqxvb761c5sh00i4xdc6n5cxwq3q";
  };

  uuid = "InternetSpeedMeter@alshakib.dev";

  installPhase = ''
    mkdir -p $out/share/gnome-shell/extensions
    cp -r $src/src $out/share/gnome-shell/extensions/${uuid}
  '';

  meta = with stdenv.lib; {
    description = "A simple and minimal internet speed meter extension for Gnome Shell";
    license = licenses.gpl3;
    maintainers = with maintainers; [ firmero ];
    homepage = "https://gitlab.com/AlShakib/InternetSpeedMeter";
  };
}
