#ufl-live-home.ks
# With KDE Desktop
# Based on Fedora Spin KDE
#
# Description:
# default UFL KDE for common user
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

part / --size 8951 --fstype ext4

%post

#setup kickoff favorites
/bin/mkdir -p /etc/skel/.config

KDEFAVORITES=/usr/share/applications/liveinst.desktop,/usr/share/applications/firefox.desktop,/usr/share/applications/org.kde.dolphin.desktop,/usr/share/applications/libreoffice-writer.desktop,/usr/share/applications/libreoffice-calc.desktop,/usr/share/applications/libreoffice-impress.desktop,/usr/share/applications/org.kde.konsole.desktop,/usr/share/applications/systemsettings.desktop
KDEFAVORITESLIVE=/usr/share/applications/liveinst.desktop,$KDEFAVORITES

cat <<EOF  >> /etc/skel/.config/kickoffrc
[Favorites]
FavoriteURLs=$KDEFAVORITES
EOF

# Override ufl-live-kde-base.ks settings
sed -i /etc/rc.d/init.d/livesys -res"#^(FavoriteURLs=).*#\1${KDEFAVORITESLIVE}#"

%end
# standard nochroot
%include kickstart/ufl-live-post-nochroot.ks
