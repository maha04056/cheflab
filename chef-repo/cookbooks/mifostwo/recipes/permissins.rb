#
# Cookbook:: .
# Recipe:: permissins
#
# Copyright:: 2017, The Authors, All Rights Reserved.

execute 'group owner ship' do
  command 'chgrp -R tomcat /opt/tomcat/conf'
  action :run
end

execute 'group read write execute' do
  command 'chmod g+rwx /opt/tomcat/conf'
  action :run
end


execute 'read' do
  command 'chmod g+r /opt/tomcat/conf/*'
  action :run
end

execute 'name' do
  command 'chown -R tomcat /opt/tomcat/work/  /opt/tomcat/temp/ /opt/tomcat/logs/'
  action :run
end


