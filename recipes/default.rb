#
# Cookbook Name:: dante_ng
# Recipe:: default
#
# Copyright 2018, Alexander Merkulov
#

execute "rpm -ivh #{node['dante_ng']['packages'].join(" ")}"

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
