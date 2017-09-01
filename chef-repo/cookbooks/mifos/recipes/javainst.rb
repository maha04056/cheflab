#
# Cookbook:: .
# Recipe:: javainst
#
# Copyright:: 2017, The Authors, All Rights Reserved.

apt_update 'update package' do
 action :update
end

package 'python-software-properties' do
  action :install
end
package 'default-jdk' do
  action :install
end







