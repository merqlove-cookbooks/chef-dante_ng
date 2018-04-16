default['dante_ng']['service'] = 'sockd'
default['dante_ng']['username'] = 'username'
default['dante_ng']['password'] = '$1$kcSDsFuP$Cgnz7eWjWInLF8dEHtgFk/' # 12345678
default['dante_ng']['packages'] = [
  "https://rpmfind.net/linux/dag/redhat/el6/en/x86_64/dag/RPMS/dante-1.4.0-1.el6.rf.x86_64.rpm",
  "https://rpmfind.net/linux/dag/redhat/el6/en/x86_64/dag/RPMS/dante-server-1.4.0-1.el6.rf.x86_64.rpm",
  "https://rpmfind.net/linux/dag/redhat/el6/en/x86_64/dag/RPMS/miniupnpc-1.5-1.el6.rf.x86_64.rpm",
  "https://rpmfind.net/linux/dag/redhat/el6/en/x86_64/dag/RPMS/miniupnpc-devel-1.5-1.el6.rf.x86_64.rpm"
]

default['dante_ng']['config_path'] = '/etc/sockd.conf'

default['dante_ng']["config"]['socksmethod'] = 'username'
default['dante_ng']["config"]['logoutput'] = 'stderr'
default['dante_ng']["config"]['internals'] = {
  "eth0": 57500,
  "127.0.0.1": 57500
}
default['dante_ng']["config"]['external'] = 'eth0'
default['dante_ng']["config"]['socksmethod'] = 'username'
default['dante_ng']["config"]['user.privileged'] = 'root'
default['dante_ng']["config"]['user.notprivileged'] = node['dante_ng']['username']
default['dante_ng']["config"]['client_pass'] = {
  from: "0.0.0.0/0",
  to: "0.0.0.0/0",
  log: "error"
}
default['dante_ng']["config"]['socks_pass'] = {
  from: "0.0.0.0/0",
  to: "0.0.0.0/0",
  protocol: "tcp udp",
  log: "error"
}
