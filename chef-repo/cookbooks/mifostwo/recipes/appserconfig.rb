template '/opt/tomcat/conf/server.xml' do
  source 'serverss.erb'
  mode '0755'
  action :create
end
