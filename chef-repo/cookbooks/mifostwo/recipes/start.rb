#
# Cookbook:: .
# Recipe:: start
#
# Copyright:: 2017, The Authors, All Rights Reserved.

template '/opt/tomcat/conf/tomcat-users.xml' do
  source 'tomcat.u.xml.erb'
  mode '0755'
  action :create
end


