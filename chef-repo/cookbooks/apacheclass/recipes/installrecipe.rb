apt_update 'upate packages' do
    action :upate
end


packagename = node['appacheclass']['packagename']
package packagename do
  action :install
end

service packagename do
  action :enable
end

file '/var/www/html/index' do
  content 'This is a test page from chef'
  action :create
  notifies :restart, "service[#{packagename}]"
end
