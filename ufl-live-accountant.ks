# ufl-live-accountant.ks
# With KDE Desktop
# Based on Fedora Labs Python Classroom and Scientific
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

# note
# https://wiki.manjaro.org/index.php?title=List_of_Qt_Applications

%include kickstart/ufl-live-kde.ks

# Size partition
part / --size 9300 --fstype ext4

%packages

pspp
gnucash
homebank
skrooge
grisbi
expendable
kmymoney

%end

%post

#setup kickoff favorites
/bin/mkdir -p /etc/skel/.config

ECONOMYFAVORITES=/usr/share/applications/firefox.desktop,/usr/share/applications/org.kde.dolphin.desktop,/usr/share/applications/expendable.desktop,/usr/share/applications/gnucash.desktop,/usr/share/applications/grisbi.desktop,/usr/share/applications/homebank.desktop,/usr/share/applications/org.kde.kmymoney.desktop,/usr/share/applications/pspp.desktop,/usr/share/applications/org.kde.skrooge.desktop
ECONOMYFAVORITESLIVE=/usr/share/applications/liveinst.desktop,$ECONOMYFAVORITES

cat <<EOF  >> /etc/skel/.config/kickoffrc
[Favorites]
FavoriteURLs=$ECONOMYFAVORITES
EOF

# Override ufl-live-kde-base.ks settings
sed -i /etc/rc.d/init.d/livesys -res"#^(FavoriteURLs=).*#\1${ECONOMYFAVORITESLIVE}#"

%end

# standard nochroot
%include kickstart/ufl-live-post-nochroot.ks
