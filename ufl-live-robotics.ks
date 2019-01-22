# ufl-live-electro.ks
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

part / --size 13190 --fstype ext4

%packages

# Add robotics development packages
@robotics-suite
pcl-devel
player-devel
stage-devel
mrpt-devel

# Add version control packages
git
mercurial

# Remove office suite
#-libreoffice-* need office
-planner

# Drop the Java plugin
-icedtea-web

# Drop things that pull in perl
-linux-atm

# No printing
-foomatic-db-ppds
-foomatic

# Dictionaries are big
-aspell-*
#-hunspell-* need for robotic kde
-man-pages*
-words

# Help and art can be big, too
-gnome-user-docs
-evolution-help
-desktop-backgrounds-basic
-*backgrounds-extras

# Legacy cmdline things we don't want
-krb5-auth-dialog
-krb5-workstation
-pam_krb5
-quota
-nano
-dos2unix
-finger
-ftp
-jwhois
-mtr
-pinfo
-rsh
-nfs-utils
-ypbind
-yp-tools
-rpcbind
-acpid
-ntsysv

# Drop some system-config things
-system-config-language
-system-config-network
-system-config-rootpassword
-system-config-services
-policycoreutils-gui

%end

%post

#setup kickoff favorites
/bin/mkdir -p /etc/skel/.config

ROBOTICSFAVORITES=/usr/share/applications/firefox.desktop,/usr/share/applications/org.kde.dolphin.desktop,/usr/share/applications/eclipse.desktop,/usr/share/applications/org.kde.konsole.desktop
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
