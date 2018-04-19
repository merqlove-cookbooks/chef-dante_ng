#
# Cookbook Name:: dante_ng
# Recipe:: setup
#
# Copyright 2018, Alexander Merkulov
#

user node['dante_ng']['username'] do
  comment 'Dante User'
  home "/home/#{node['dante_ng']['username']}"
  shell '/bin/false'
  password node['dante_ng']['password']
end

template node['dante_ng']['config_path'] do
  source 'sockd.conf.erb'
  mode '0600'
  owner 'root'
  group 'root'
end
