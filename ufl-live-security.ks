# ufl-live-security.ks
# With KDE Desktop
# Based on Fedora Labs Security
#
# Description:
# A fully functional live OS based on Fedora for use in security auditing, 
# forensics research, and penetration testing.
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

# spin was failing to compose due to lack of space, so bumping the size.
part / --size 10362 --fstype ext4

%packages

# Security tools
@security-lab
security-menus

# unlock default keyring. FIXME: Should probably be done in comps
gnome-keyring-pam

# save some space
-autofs
-acpid
-gimp-help
-desktop-backgrounds-basic
#-realmd                     # only seems to be used in GNOME, need for kde
#-PackageKit*                # we switched to dnfdragora, so we don't need this, need for kde
-aspell-*                   # dictionaries are big
-gnumeric
-foomatic-db-ppds
-foomatic
-stix-fonts
-ibus-typing-booster
-man-pages-*

# drop some system-config things
-system-config-rootpassword
-policycoreutils-gui

# exclude some packages to save some space
# use './fsl-maintenance.py -l' in your security spin git folder to build
ArpON
aide
binwalk
bkhive
bonesi
bro
cmospwd
dnstop
etherape
hfsutils
httpie
httrack
hydra
kismon
labrea
nebula
netsed
onesixtyone
packETH
pads
pdfcrack
proxychains
pyrit
raddump
rkhunter
safecopy
samdump2
scalpel
sslstrip
tcpreen
tcpreplay
tripwire
wipe
wireshark
zmap

-ntop

%end

%post

#setup kickoff favorites
/bin/mkdir -p /etc/skel/.config

SECURITYSFAVORITES=/usr/share/applications/firefox.desktop,/usr/share/applications/org.kde.dolphin.desktop,/usr/share/applications/etherape.desktop,/usr/share/applications/kismon.desktop,/usr/share/applications/packETH.desktop,/usr/share/applications/WebHTTrack.desktop,/usr/share/applications/wireshark.desktop
SECURITYSFAVORITESLIVE=/usr/share/applications/liveinst.desktop,$SECURITYSFAVORITES

cat <<EOF  >> /etc/skel/.config/kickoffrc
[Favorites]
FavoriteURLs=$SECURITYSFAVORITES
EOF

# Override fedora-live-kde-base.ks settings
sed -i /etc/rc.d/init.d/livesys -res"#^(FavoriteURLs=).*#\1${SECURITYSFAVORITESLIVE}#"

%end

# standard nochroot
%include kickstart/ufl-live-post-nochroot.ks
