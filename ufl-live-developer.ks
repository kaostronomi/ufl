# ufl-live-developer.ks
# With KDE Desktop
# Based on Fedora Labs Python Classroom and Scientific
#
# Description:
# Common packages of Python Classroom, Scientific, Ruby and Many languages
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

%include kickstart/ufl-live-kde.ks

# Size partition
part / --size 12663 --fstype ext4

%packages

# ides:
#python:kde
ninja-ide

# c/c++:kde
kdevelop
kdevelop-php
kdevelop-python
kdevelop-pg-qt

#qt:kde
qt-creator
qt5-designer

# good code:kde
krazy2

# qt devel depedencies
qt5-qtdeclarative
qt5-qtdeclarative-devel
qt-assistant
qt-devel

#devel tools:
#install the mandatory packages from dev-tools and dev-libs
# c/c++ compiler, gdb, autotools, bison, flex, make, strace..
@development-tools
@development-libs
@c-development
@rpm-development-tools
# C++ libraries
blitz-devel
armadillo-devel

# version control
# Mercurial
mercurial
mercurial-hgk

# Misc. related utils
ddd
valgrind

# dictionary
words

# global
global
ctags

# npm
npm

# c:
# gcc
gcc
# compiling 32-bit binaries on a 64-bit fedora
libgcc.i686
glibc-devel.i686
# clang
clang
# c++
gcc-c++
# autotools
autoconf
automake
# cmake
cmake
# static analysis
csbuild

# python:
@python-classroom
-thonny
-mu
-python3-idle
@python-science
openssh-clients
micropython
uflash
esptool
picocom
pygobject3
python3-gobject
python3-tox

# bpython
bpython
python3-bpython

# django
python3-pip 
python3-virtualenv 
python3-virtualenvwrapper 
python3-django

#python 2 tools/libraries not included from the groups
python2-tools
python-ipython
python-ipython-console
python-ipython-notebook
sympy
python-networkx
python-pandas

#python 3 and tools/libraries not included from the groups
python3
#python3-tools #error package
python3-matplotlib
python3-numpy
python3-networkx
python3-ipython
python3-ipython-console
python3-ipython-notebook
python3-pandas
python3-pillow-tk
python3-scipy
python3-sphinx
python3-sympy

# matplotlib backends
python-matplotlib-qt4
python-matplotlib-tk
python3-matplotlib-qt4
python3-matplotlib-tk

# rpm packaging
fedora-packager
rpmdevtools
gcc
mock
mock-scm

# cruby
ruby
rubygem-rake
rubygem-test-unit
# jruby
jruby
# gems
@c-development
ruby-devel
zlib-devel
patch
rubygem-thor
# bundler (gem install bundler)
ruby
rubygem-bundler
# ruby on rails (or gem install rails)
@c-development
ruby-devel
zlib-devel
rubygem-rails
@rubyonrails
# sinatra (or gem install sinatra)
ruby
rubygem-sinatra

# ruby on rails
git-core
zlib
zlib-devel
gcc-c++
patch
readline
readline-devel
libyaml-devel
libffi-devel
openssl-devel
make
bzip2
autoconf
automake
libtool
bison
curl
sqlite-devel

# databases
# mongodb
mongodb
mongodb-server
# sqlite
sqlite
sqlite-devel
sqlite-tcl
sqlite-jdbc
sqliteman
# postgresql
postgresql
postgresql-server
# mariadb sql
mariadb
mariadb-server
phpMyAdmin
# cassandra
cassandra
cassandra-server

%end

%post

#setup kickoff favorites
/bin/mkdir -p /etc/skel/.config

DEVELOPERFAVORITES=/usr/share/applications/firefox.desktop,/usr/share/applications/org.kde.dolphin.desktop,/usr/share/applications/ninja-ide.desktop,/usr/share/applications/org.kde.kdevelop.desktop,/usr/share/applications/org.qt-project.qtcreator.desktop,/usr/share/applications/qt5-designer.desktop,/usr/share/applications/org.kde.konsole.desktop
DEVELOPERFAVORITESLIVE=/usr/share/applications/liveinst.desktop,$DEVELOPERFAVORITES

cat <<EOF  >> /etc/skel/.config/kickoffrc
[Favorites]
FavoriteURLs=$DEVELOPERFAVORITES
EOF

# Override ufl-live-kde-base.ks settings
sed -i /etc/rc.d/init.d/livesys -res"#^(FavoriteURLs=).*#\1${DEVELOPERFAVORITESLIVE}#"

%end

# standard nochroot
%include kickstart/ufl-live-post-nochroot.ks
