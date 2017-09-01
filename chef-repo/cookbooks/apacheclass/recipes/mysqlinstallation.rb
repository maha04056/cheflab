#
# Cookbook:: .
# Recipe:: mysqlinstallation
#
# Copyright:: 2017, The Authors, All Rights Reserved.

mysql_service 'default' do
  version '5.7'
  bind_address '0.0.0.0'
  port '3306'
  initial_root_password data_bag_item(‘admin’, ‘charlie’,’qt”)
  action [:create, :start]
end

