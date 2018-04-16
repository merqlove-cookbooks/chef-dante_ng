#
# Cookbook Name:: dante_ng
# Recipe:: default
#
# Copyright 2018, Alexander Merkulov
#

yum_repository 'rpmforge' do
  mirrorlist 'http://mirrorlist.repoforge.org/el6/mirrors-rpmforge'
  description 'RHEL $releasever - RPMforge.net - dag'
  enabled true
  gpgcheck true
  gpgkey 'http://apt.sw.be/RPM-GPG-KEY.dag.txt'
end

node['dante_ng']['packages'].each do |p|
  package p
end

user node['dante_ng']['username'] do
  comment 'Dante User'
  home "/home/#{node['dante_ng']['username']}"
  shell '/bin/false'
  password node['dante_ng']['password']
end

template node['dante_ng']['config_path'] do
  source 'sockd.conf.erb'
  mode '0440'
  owner 'root'
  group 'root'
end

service 'sockd' do
  service_name 'sockd'
  action [:start, :enable]
end
