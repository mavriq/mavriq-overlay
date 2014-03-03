# Calculate chmod=555
#!/bin/sh
[ -d /mnt/iso ] && mkdir ${NEW_ROOT}/mnt/iso && mount --bind /mnt/iso ${NEW_ROOT}/mnt/iso
