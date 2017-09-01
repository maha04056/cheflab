remote_file '/opt/tomcat/lib/drizzle-jdbc-1.3.jar' do
  source 'http://central.maven.org/maven2/org/drizzle/jdbc/drizzle-jdbc/1.3/drizzle-jdbc-1.3.jar'
  action :create
end


remote_file '/opt/tomcat/lib/mysql-connector-java-5.1.40.jar' do
  source 'http://central.maven.org/maven2/mysql/mysql-connector-java/5.1.40/mysql-connector-java-5.1.40.jar'
  action :create
end
