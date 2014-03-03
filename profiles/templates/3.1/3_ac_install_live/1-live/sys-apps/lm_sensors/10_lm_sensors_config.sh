# Calculate exec=/bin/bash exists(/etc/conf.d/lm_sensors)==

echo "Run sensors-detect in background"
sh -c "( /bin/yes '' | /usr/sbin/sensors-detect; /usr/bin/touch /etc/conf.d/lm_sensors; /etc/init.d/lm_sensors start ) &>/dev/null &"
: