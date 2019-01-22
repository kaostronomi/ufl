%packages
@firefox
@kde-apps
@kde-desktop
@kde-media
@kde-office
@kde-telepathy
@networkmanager-submodules

### The KDE-Desktop

### Browser
-qupzilla #duplicat function :firefox

### fixes

# use kde-print-manager instead of system-config-printer
-system-config-printer
# make sure mariadb lands instead of MySQL (hopefully a temporary hack)
mariadb-embedded
#mariadb-libs #need for kde
mariadb-server

# minimal localization support - allows installing the kde-l10n-* packages
system-config-language
kde-l10n

# unwanted packages from @kde-desktop
# don't include these for now to fit on a cd
-desktop-backgrounds-basic
-kdeaccessibility*
#-ktorrent          # kget has also basic torrent features (~3 megs)
-digikam            # digikam has duplicate functionality with gwenview (~28 megs)
#-amarok            # ~23 megs (mysql-embedded etc.)
-kipi-plugins       # ~8 megs + drags in Marble
#-kdeplasma-addons  # ~16 megs
#-krusader          # ~4 megs

# Additional packages that are not default in kde-* groups, but useful
k3b                 # ~15 megs
#kdeartwork         # only include some parts of kdeartwork
fuse
#mediawriter, alternative : isoimagewriter

### space issues

# fonts (we make no bones about admitting we're english-only)
wqy-microhei-fonts              # a compact CJK font, to replace:
-naver-nanum-gothic-fonts       # Korean
#-vlgothic-fonts                 # Japanese ,need for qcad
-adobe-source-han-sans-cn-fonts # simplified Chinese
-adobe-source-han-sans-tw-fonts # traditional Chinese

-paratype-pt-sans-fonts	# Cyrillic (already supported by DejaVu), huge
#-stix-fonts		# mathematical symbols

# remove input methods to free space
-@input-methods
-scim*
#-m17n* need for kde jam
#-ibus* need ibus-libs for kde build
-iok

# admin-tools
-gnome-disk-utility
# kcm_clock still lacks some features, so keep system-config-date around
#-system-config-date
# prefer kcm_systemd
-system-config-services
# prefer/use kusers
-system-config-users

## avoid serious bugs by omitting broken stuff

#### UFL ####

# browser:kde
firefox
konqueror #kde default
-falkon
-qupzilla

# rss:kde
akregator

# irc:kde
konversation

# parted:kde
kde-partitionmanager

# gdrive:kde
kio-gdrive

# mtp:kde
kio_mtp

# support wacomtablet:kde
kcm_wacomtablet

# bluetooth:kde
bluez-obexd

# image viewer:kde
gwenview

# thumbnail:kde
ffmpegthumbs

# video thumbnail:kde
kffmpegthumbnailer

# encrypt:kde
kleopatra
sirikali

# text editor:kde
kwrite

# downloader & torrent:kde
kget

#disc burner:kde
k3b

# image editing
kolourpaint

# music player:kde
amarok
-juk

# video player:kde
dragon

# password manager:kde
kwalletmanager

# backup:kde
kbackup

# disk free:kde
kdf

# rename:kde
krename

#systemlog:kde
ksystemlog

# keyboard monitor:kde
key-mon

# scan image:kde
skanlite

#converter:kde
-ffmulticonverter
qwinff

# cleaner:kde
sweeper

# record Desktop:kde
simplescreenrecorder

# remote desktop:kde
krdc

# desktop sharing:kde
krfb

# virtual machine:qt
aqemu #virtualbox

# virtual keyboard:kde
kvkbd

# bootable:kde
isoimagewriter

%end
