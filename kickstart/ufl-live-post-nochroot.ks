%post --nochroot
# standard chroot

cp -fr  recipes/firefox/* \
        $INSTALL_ROOT/

cp -fr  recipes/plymouth/* \
        $INSTALL_ROOT/

cp -fr  recipes/skel-default/* \
        $INSTALL_ROOT/

cp -fr  recipes/skel-default-root/root/ \
        $INSTALL_ROOT/

%end

# for branding and modification
#%include kickstart/ufl-live-post-nochroot-kde-branding.ks
