%post --nochroot

# generic logo
cp -fr  recipes/generic-logos/* \
        $INSTALL_ROOT/

# generic release
cp -fr  recipes/generic-release/* \
        $INSTALL_ROOT/

# icons
cp -fr  recipes/icons/* \
        $INSTALL_ROOT/

# background base
cp -fr  recipes/f29-backgrounds-base/* \
        $INSTALL_ROOT/

# background kde
cp -fr  recipes/f29-backgrounds-kde/* \
        $INSTALL_ROOT/

%end
