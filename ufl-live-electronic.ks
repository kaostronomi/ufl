# ufl-live-electronic.ks
# With KDE Desktop
# Based on Fedora Labs Robotics
#
# Description:
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

part / --size 15306 --fstype ext4

%packages

# electric
kicad
kicad-packages3d
pcb
openboardview
flatcam
arduino
rcrpanel
xcircuit
avra

%end

%post

#setup kickoff favorites
/bin/mkdir -p /etc/skel/.config

ROBOTICSFAVORITES=/usr/share/applications/firefox.desktop,/usr/share/applications/org.kde.dolphin.desktop,/usr/share/applications/arduino.desktop,/usr/share/applications/flatcam.desktop,/usr/share/applications/kicad.desktop,/usr/share/applications/pcb.desktop,/usr/share/applications/openboardview.desktop,/usr/share/applications/xcircuit.desktop
ROBOTICSFAVORITESLIVE=/usr/share/applications/liveinst.desktop,$ROBOTICSFAVORITES

cat <<EOF  >> /etc/skel/.config/kickoffrc
[Favorites]
FavoriteURLs=$ROBOTICSFAVORITES
EOF

# Override fedora-live-kde-base.ks settings
sed -i /etc/rc.d/init.d/livesys -res"#^(FavoriteURLs=).*#\1${ROBOTICSFAVORITESLIVE}#"

%end

# standard nochroot
%include kickstart/ufl-live-post-nochroot.ks
