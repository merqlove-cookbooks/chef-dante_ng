#
# Cookbook Name:: dante_ng
# Recipe:: service
#
# Copyright 2018, Alexander Merkulov
#

service node['dante_ng']['service'] do
  service_name node['dante_ng']['service']
  action [:start, :enable]
end
