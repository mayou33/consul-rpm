getent group consul >/dev/null || groupadd -r consul
getent passwd consul >/dev/null || useradd -r -g consul -d /var/lib/consul -s /sbin/nologin -c "consul user" consul
if [ ! -d /data/consul ]; then 
     mkdir -p /data/consul/{config,data,log}
     chown -R consul:consul   /data/consul
     chmod -R 0755 /data/consul
fi


mkdir /etc/rsyslog.d
cat >/etc/rsyslog.d/consul.conf <<EOF
local0.* /data/consul/log/consul.log
EOF

  cat > /etc/rsyslog.d/50-default.conf<<EOF
*.*;auth,authpriv.none,local0.none          -/var/log/syslog
EOF


cat >/etc/logrotate.d/consul <<EOF
/data/consul/log/*log {
missingok
compress
notifempty
daily
rotate 5
create 0600 root root
}
EOF

systemctl restart rsyslog

