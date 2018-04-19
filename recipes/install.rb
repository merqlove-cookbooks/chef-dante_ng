#
# Cookbook Name:: dante_ng
# Recipe:: install
#
# Copyright 2018, Alexander Merkulov
#

node['dante_ng']['packages'].each do |p|
  package p
end

remote_file "#{Chef::Config[:file_cache_path]}/dante-#{node['dante_ng']['version']}.tar.gz" do
  source   node['dante_ng']['url']
  checksum node['dante_ng']['checksum']
  action   :create
  notifies :run, 'bash[compile_dante_from_source]', :immediately
end

bash 'compile_dante_from_source' do
  cwd Chef::Config[:file_cache_path]
  code <<-EOH
    tar -xvf dante-#{node['dante_ng']['version']}.tar.gz
    cd dante-#{node['dante_ng']['version']}
    make && make install
  EOH
  action :nothing
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
