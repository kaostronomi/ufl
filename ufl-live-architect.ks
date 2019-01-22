# ufl-live-developer.ks
# With KDE Desktop
# Based on Fedora Labs Python Classroom and Scientific
#
# Description:
# Common packages of Python Classroom, Scientific and Many languages
# A collection of applications targeted towards professional developer
#
# Website: https://www.gitlab.com/kaostronomi/ufl
# Maintainer:
# - Hervy Qurrotul Ainur Rozi < kaostronomi AT gmail DOT com >

# Note :
# For branding please uncomment:
# "%include kickstart/ufl-live-branding.ks" in kickstart/ufl-live-base.ks
# and
# "%include kickstart/ufl-live-post-nochroot-kde-branding.ks" in kickstart/ufl-live-post-nochroot.ks

# note
# https://wiki.manjaro.org/index.php?title=List_of_Qt_Applications

%include kickstart/ufl-live-kde.ks

# Size partition
part / --size 10680 --fstype ext4

%packages

#cad
librecad
qcad
freecad
openscad

%end

%post

#setup kickoff favorites
/bin/mkdir -p /etc/skel/.config

ARCHITECTFAVORITES=/usr/share/applications/firefox.desktop,/usr/share/applications/org.kde.dolphin.desktop,/usr/share/applications/freecad.desktop,/usr/share/applications/librecad.desktop,/usr/share/applications/openscad.desktop,/usr/share/applications/qcad.desktop
ARCHITECTFAVORITESLIVE=/usr/share/applications/liveinst.desktop,$ARCHITECTFAVORITES

cat <<EOF  >> /etc/skel/.config/kickoffrc
[Favorites]
FavoriteURLs=$ARCHITECTFAVORITES
EOF

# Override ufl-live-kde-base.ks settings
sed -i /etc/rc.d/init.d/livesys -res"#^(FavoriteURLs=).*#\1${ARCHITECTFAVORITESLIVE}#"

%end

# standard nochroot
%include kickstart/ufl-live-post-nochroot.ks
