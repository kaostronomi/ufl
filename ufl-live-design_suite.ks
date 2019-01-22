# ufl-design-suite.ks
# With KDE Desktop
# Based on Fedora Labs Design Suite
#
# Description:
# A collection of applications targeted towards professional visual designers
#
# Website: https://www.gitlab.com/kaostronomi/ufl
# Maintainer:
# - Hervy Qurrotul Ainur Rozi < kaostronomi AT gmail DOT com >

# Note :
# For branding please uncomment:
# "%include kickstart/ufl-live-branding.ks" in kickstart/ufl-live-base.ks
# and
# "%include kickstart/ufl-live-post-nochroot-kde-branding.ks" in kickstart/ufl-live-post-nochroot.ks

%include kickstart/ufl-live-kde.ks

# Size partition
part / --size 10688 --fstype ext4

%packages

# inkscape plugin
inkscape
inkscape-psd
inkscape-sozi
inkscape-table

# gimp plugin
gimp
gimpfx-foundry
gimp-paint-studio
gimp-dds-plugin 
gimp-fourier-plugin 
gimp-gap
gimp-high-pass-filter
gimp-layer-via-copy-cut
gimp-lensfun
gimp-lqr-plugin
gimp-normalmap
gimp-paint-studio
gimp-resynthesizer
gimp-save-for-web
gimp-separate+
gimp-wavelet-decompose
gmic-gimp

# video editor:kde
kdenlive
frei0r-plugins

# layout:kde
scribus

# painting:kde
krita

# 2d animation:kde
synfigstudio

# pattern editor:kde
kxstitch

# photographer
darktable

# audio editor:kde
kwave

# transcoding tool:kde
avidemux-qt

# prefesional photo management:kde
entangle
digikam

# lightroom
darktable

# font editing
fontforge

# 3d animation
blender
YafaRay-blender

# optimal png
optipng

# color extras
colord-extra-profiles

# fonts from design-suite
aajohan-comfortaa-fonts
julietaula-montserrat-fonts
lato-fonts
open-sans-fonts
overpass-fonts

%end

%post

#setup kickoff favorites
/bin/mkdir -p /etc/skel/.config

DESIGNFAVORITES=/usr/share/applications/firefox.desktop,/usr/share/applications/org.kde.dolphin.desktop,/usr/share/applications/blender.desktop,/usr/share/applications/fontforge.desktop,/usr/share/applications/gimp.desktop,/usr/share/applications/inkscape.desktop,/usr/share/applications/org.kde.kdenlive.desktop,/usr/share/applications/org.kde.krita.desktop,/usr/share/applications/scribus.desktop,/usr/share/applications/synfigstudio.desktop,
DESIGNFAVORITESLIVE=/usr/share/applications/liveinst.desktop,$DESIGNFAVORITES

cat <<EOF  >> /etc/skel/.config/kickoffrc
[Favorites]
FavoriteURLs=$DESIGNFAVORITES
EOF

# Override ufl-live-kde-base.ks settings
sed -i /etc/rc.d/init.d/livesys -res"#^(FavoriteURLs=).*#\1${DESIGNFAVORITESLIVE}#"

%end

# standard nochroot
%include kickstart/ufl-live-post-nochroot.ks
