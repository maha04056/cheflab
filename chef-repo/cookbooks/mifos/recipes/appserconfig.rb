template '/opt/tomcat/conf/server.xml' do
  source 'serverss.erb'
  mode '0755'
  action :create
end

remote_file '/opt/tomcat/lib/drizzle-jdbc-1.3.jar' do
  source 'http://central.maven.org/maven2/org/drizzle/jdbc/drizzle-jdbc/1.3/drizzle-jdbc-1.3.jar'
  action :create
end


remote_file '/opt/tomcat/lib/mysql-connector-java-5.1.40.jar' do
  source 'http://central.maven.org/maven2/mysql/mysql-connector-java/5.1.40/mysql-connector-java-5.1.40.jar'
  action :create
end




remote_file '/home/ubuntu/mifosplatform-17.07.01.RELEASE.zip' do
  source 'https://excellmedia.dl.sourceforge.net/project/mifos/Mifos%20X/mifosplatform-17.07.01.RELEASE.zip'
  action :create
end

package 'unzip' do
  action :install
end



execute 'untar' do
  command 'unzip /home/ubuntu/mifosplatform-17.07.01.RELEASE.zip  -d /home/ubuntu'
  action :run
  not_if { ::File.exist?('/home/ubuntu/testzip.started') }
end


file '/home/ubuntu/testzip.started' do
  owner 'root'
  group 'root'
  mode '0755'
  action :create
 end


remote_file '/opt/tomcat/webapps/fineract-provider.war' do 
  source 'file:////home/ubuntu/fineractplatform-17.07.01.RELEASE/fineract-provider.war'
  action :create
end

execute 'restart' do
  command 'initctl restart tomcat'
  action :run
end

