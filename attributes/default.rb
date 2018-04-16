default['dante_ng']['username'] = 'username'
default['dante_ng']['password'] = '$1$4GSegYQW$XNIOjydYHkiLl3.R8MTd5/'
default['dante_ng']['packages'] = [
  "ftp://rpmfind.net/linux/dag/redhat/el6/en/x86_64/dag/RPMS/dante-1.4.0-1.el6.rf.x86_64.rpm",
  "http://pkgs.repoforge.org/dante/dante-server-1.4.0-1.el6.rf.x86_64.rpm",
  "http://pkgs.repoforge.org/miniupnpc/miniupnpc-devel-1.5-1.el6.rf.x86_64.rpm",
  "http://pkgs.repoforge.org/miniupnpc/miniupnpc-1.5-1.el6.rf.x86_64.rpm"
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
default['dante_ng']["config"]['user.notprivileged'] = node['dante_ng']['user']
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
