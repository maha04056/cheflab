#
# Cookbook:: .
# Recipe:: tomcatinst
#
# Copyright:: 2017, The Authors, All Rights Reserved.

user 'tomcat' do
  comment 'tomcat user'
  home '/opt/tomcat'
  shell '/bin/false'
  action :create
end

group 'tomcat' do
  members 'tomcat'
  action :create
end


remote_file '/home/ubuntu/tomcat.tar' do
  source 'http://archive.apache.org/dist/tomcat/tomcat-8/v8.0.23/bin/apache-tomcat-8.0.23.tar.gz'
  action :create
end

directory '/opt/tomcat' do
  owner 'tomcat'
  group 'tomcat'
  mode '0755'
  action :create
end

execute 'untar' do
  command 'tar xvf /home/ubuntu/tomcat.tar -C /opt/tomcat --strip-components=1'
  action :run
  not_if { ::File.exist?('/opt/tomcat/LICENSE') }
end

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


template '/opt/tomcat/conf/tomcat-users.xml' do
  source 'tomcat-u.conf.erb'
  mode '0755'
  action :create
end


cookbook_file '/etc/init/tomcat.conf' do
  source 'tomcat.conf'
  mode '0755'
  action :create
end

execute 'reload' do
  command 'initctl reload-configuration'
  action :run
  not_if { ::File.exist?('/home/ubuntu/test.started') }
end

execute 'start' do
  command 'initctl start tomcat'
  action :run
  not_if { ::File.exist?('/home/ubuntu/test.started') }
end


file '/home/ubuntu/test.started' do
  owner 'root'
  group 'root'
  mode '0755'
  action :create
  only_if { ::File.exist?('/etc/init/tomcat.conf') }
end