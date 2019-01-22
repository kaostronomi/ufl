#ufl-live-astronomy.ks
# With KDE Desktop
# Based on Fedora Labs Astronomy
#
# Description:
# UFL Astronomy: For astronomers and astrophysicists
# UFL Astronomy aims to create a Fedora which has the generic
# toolset for the astronomer
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

part / --size 12904 --fstype ext4

%packages

# Installing the default/mandatory packages from engineering & scientific
@engineering-and-scientific

# Basic development
@development-tools
@c-development

# astronomical data analysis
astrometry
astrometry-tycho2
cdsclient
fpack
gcx
psfex
saoimage
scamp
sextractor
siril
skyviewer
swarp
wcstools

# Observatory: KStars + INDI drivers
indi-aagcloudwatcher
indi-apogee
indi-eqmod
indi-gphoto
indi-sx
indistarter
kstars

# misc. astronomy
celestia
stellarium
virtualplanet

# Some astro environment stuff
astronomy-menus
astronomy-menus-toplevel

#python 3 and tools/libraries not included from the groups
python3
python3-tools
python3-matplotlib
python3-scipy
python3-numpy
python3-ipython
python3-ipython-console
python3-ipython-notebook
python3-sympy
python3-networkx
python3-pandas
python3-pillow
python3-seaborn
python3-statsmodels
python3-scikit-learn
python3-scikit-image

# Python 3 astronomy
astropy-tools
ginga
python3-astropy
python3-astroML
python3-astroML-addons
python3-astroquery
python3-astroscrappy
python3-APLpy
python3-ATpy
python3-ccdproc
python3-fitsio
python3-gatspy
python3-photutils
python3-pyvo
python3-reproject
python3-sep
python3-wcsaxes

# matplotlib backends
python3-matplotlib-qt4
python3-matplotlib-qt5
python3-matplotlib-tk

# Python IDE very useful for scientific use
python3-spyder

#Version control- a GUI for each as well

# Installing rapidsvn will also install subversion package
rapidsvn 
git
git-gui

#Drawing, Picture viewing tools, Visualization tools
dia
gimp
kst
kst-docs
kst-fits
LabPlot

#Misc. Utils
# icedtea-web to have webstart useful for VO tools
icedtea-web
ImageMagick
kate
kate-plugins
rlwrap
screen
plasma-applet-redshift-control

# Omit KDE 4 translations for now: https://bugzilla.redhat.com/show_bug.cgi?id=1197940
-kde-l10n-*
-calligra-l10n-*

%end

%post

#setup kickoff favorites
/bin/mkdir -p /etc/skel/.config

ASTRONOMYFAVORITES=/usr/share/applications/firefox.desktop,/usr/share/applications/org.kde.dolphin.desktop,/usr/share/applications/stellarium.desktop,/usr/share/applications/celestia.desktop,/usr/share/applications/virtualplanet.desktop,/usr/share/applications/indigui.desktop,/usr/share/applications/org.kde.kstar.desktop,konsole/usr/share/applications/org.free-astro.siril.desktop,/usr/share/applications/skyviewer.desktop,/usr/share/applications/org.kde.labplot2.desktop,/usr/share/applications/kst2.desktop
ASTRONOMYFAVORITESLIVE=/usr/share/applications/liveinst.desktop,$ASTRONOMYFAVORITES

cat <<EOF  >> /etc/skel/.config/kickoffrc
[Favorites]
FavoriteURLs=$ASTRONOMYFAVORITES
EOF

# Override ufl-live-kde-base.ks settings
sed -i /etc/rc.d/init.d/livesys -res"#^(FavoriteURLs=).*#\1${ASTRONOMYFAVORITESLIVE}#"

%end

# standard nochroot
%include kickstart/ufl-live-post-nochroot.ks
