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

remote_file '/opt/tomcat/webapps/fineract-provider.war' do 
  source 'file:////home/ubuntu/fineractplatform-17.07.01.RELEASE/fineract-provider.war'
  action :create
end


file '/home/ubuntu/testzip.started' do
  owner 'root'
  group 'root'
  mode '0755'
  action :create
 end


execute 'restart' do
  command 'sudo initctl restart tomcat'
  action :run
end

