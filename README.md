# mavriq-overlay

---

## How to install this overlay on Calculate Linux
### look all profiles
    # cl-update-profile --url=git://github.com/mavriq/mavriq-overlay.git list
    System profile values:
      [CLDM]  mavriq-overlay:CLDM/x86
      [CLD]   mavriq-overlay:CLD/x86
      [CLDX]  mavriq-overlay:CLDX/x86
      [CLS]   mavriq-overlay:CLS/x86
      [CMC]   mavriq-overlay:CMC/x86
      [CDS]   mavriq-overlay:CDS/x86
      [CSS]   mavriq-overlay:CSS/x86
### install selected profile
    # cl-update-profile --url=git://github.com/mavriq/mavriq-overlay.git mavriq-overlay:CDS/x86 --rebuild-world

---

## How to install this overlay on Gentoo
    # mkdir -pv /etc/layman/overlays
    # wget https://raw.githubusercontent.com/mavriq/mavriq-overlay/master/mavriq-overlay.xml -O /etc/layman/overlays/mavriq-overlay.xml
    # layman -f && layman -a mavriq-overlay
