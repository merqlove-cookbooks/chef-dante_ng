#
# Cookbook Name:: dante_ng
# Recipe:: default
#
# Copyright 2018, Alexander Merkulov
#

execute "install dante" do
  command "rpm -ivh #{node['dante_ng']['packages'].join(" ")}"
  not_if "which /etc/init.d/#{node['dante_ng']['service']}"
end

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

service node['dante_ng']['service'] do
  service_name node['dante_ng']['service']
  action [:start, :enable]
end
