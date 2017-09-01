#
# Cookbook:: .
# Recipe:: apacheintall
#
# Copyright:: 2017, The Authors, All Rights Reserved.


apt_update 'update package' do
 action :update
end

pname = node['apachelab']['pakname']
pathn = node['apachelab']['pathname']

package pname do
  action :install
end

service pname do
  action :start
end

file pathn do
  content 'This is a test page for chef'
  action :create
  notifies :restart, "service[#{pname}]"
end




