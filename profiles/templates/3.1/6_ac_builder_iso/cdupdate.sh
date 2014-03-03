# Calculate chmod=0555
#!/bin/sh

if [ -z "${NEW_ROOT}" ]; then
    export NEW_ROOT=/union/
fi

for f in /mnt/cdrom/cdupdate.d/* /mnt/iso/cdupdate.d/* ; do
    if [ -f "$f" -a -x "$f" ]; then
        echo "Run $f"
        "$f"
        x=$?
        [ 0 -eq $x ] && x="OK"
        echo "returncode: [${x}]"
    fi
done
