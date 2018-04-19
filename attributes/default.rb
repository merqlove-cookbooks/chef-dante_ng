default['dante_ng']['service'] = 'sockd'
default['dante_ng']['username'] = 'username'
default['dante_ng']['password'] = '$1$kcSDsFuP$Cgnz7eWjWInLF8dEHtgFk/' # 12345678

default['dante_ng']['verion'] = '1.4.2'
default['dante_ng']['url'] = "https://www.inet.no/dante/files/dante-#{node['dante_ng']['verion']}.tar.gz"
default['dante_ng']['checksum'] = 'baa25750633a7f9f37467ee43afdf7a95c80274394eddd7dcd4e1542aa75caad'

default['dante_ng']['packages'] = [
  "pam-devel",
  "miniupnpc-devel"
]

default['dante_ng']['config_path'] = '/etc/sockd.conf'

default['dante_ng']["config"]['socksmethod'] = 'pam'
default['dante_ng']["config"]['logoutput'] = 'stderr'
default['dante_ng']["config"]['internals'] = {
  "eth0": 57500
}
default['dante_ng']["config"]['external'] = 'eth0'
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
  socksmethod: "pam",
  protocol: "tcp udp",
  log: "connect disconnect error"
}
