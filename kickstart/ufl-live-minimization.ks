# Common packages removed from comps
# For F14, these removals should be moved to comps itself

%packages

# save some space
-mpage
#-sox #need sox for mlt kdenlive
-hplip
-numactl
-isdn4k-utils
-autofs
# smartcards won't really work on the livecd.
-coolkey
#-wget need

# scanning takes quite a bit of space :/
-xsane
-xsane-gimp
-sane-backends

# remove calligra, duclicate function with libreoffice
-calligra*

# reduce font
-lohit*
-google-noto-sans-sinhala-fonts
-google-noto-fonts-common
-google-noto-cjk-fonts-common
-google-noto-sans-cjk-ttc-fonts
-google-noto-serif-cjk-ttc-fonts
-paktype-naskh-basic-fonts
-khmeros-base-fonts
-smc-meera-fonts
-thai-scalable-waree-fonts
-jomolhari-fonts

# remove plymouth charge
-plymouth-theme-charge
-plymouth-system-theme

%end
