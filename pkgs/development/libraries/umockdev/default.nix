{ stdenv, fetchFromGitHub, automake, autoconf, libtool, gtk-doc
, pkgconfig, glib, systemd, libgudev, vala }:

stdenv.mkDerivation rec {
  name = "umockdev-${version}";
  version = "0.11.3";

  src = fetchFromGitHub {
    owner = "martinpitt";
    repo = "umockdev";
    rev = version;
    sha256 ="1z101yw7clxz39im3y435s3rj1gna3kp0fkj9wd62vxqvk68lhik";
  };

  buildInputs = [ glib systemd libgudev ];
  nativeBuildInputs = [ automake autoconf libtool gtk-doc pkgconfig vala ];

  preConfigure = "NOCONFIGURE=1 ./autogen.sh";

  meta = with stdenv.lib; {
    description = "Mock hardware devices for creating unit tests";
    license = licenses.lgpl2;
    maintainers = [ maintainers.ndowens ];
    platforms = with platforms; linux;
  };
}
