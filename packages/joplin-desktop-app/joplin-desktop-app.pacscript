name="joplin-desktop-app"
gives="joplin-desktop"
pkgver="2.13.15"
makedepends=("libfuse2")
depends=("libfuse2")
homepage='https://joplinapp.org/'
pkgdesc="Joplin - the secure note taking and to-do app with synchronisation capabilities for Windows, macOS, Linux, Android and iOS"
url="https://github.com/laurent22/joplin/releases/download/v${pkgver}/Joplin-${pkgver}.AppImage"
hash="e6d2ce3400a165a889aaf2bf960d4d1931f72d80657b32009ad42f9e0d2734d7"
repology=("project: joplin-desktop")
arch=("amd64")
maintainer="lfromanini <lfromanini@yahoo.com>"

package() {
  sudo install -Dm755 "Joplin-${pkgver}.AppImage" "${pkgdir}/usr/bin/${gives}"
  wget -q -O "joplin-desktop.png" "https://joplinapp.org/images/Icon512.png"
  sudo install -Dm644 "joplin-desktop.png" "${pkgdir}/usr/share/pixmaps/joplin-desktop.png"
  sudo mkdir -p "${pkgdir}/usr/share/applications/"
  echo "[Desktop Entry]
    Encoding=UTF-8
    Name=Joplin
    Comment=Joplin for Desktop
    Exec=joplin-desktop %u
    Icon=joplin-desktop
    StartupWMClass=Joplin
    Type=Application
    Categories=Office;
    MimeType=x-scheme-handler/joplin;
    X-GNOME-SingleWindow=true
    X-SingleMainWindow=true" | sudo tee "${pkgdir}/usr/share/applications/joplin-desktop.desktop" > /dev/null
}
