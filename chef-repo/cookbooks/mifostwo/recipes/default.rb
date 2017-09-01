#
# Cookbook:: testin
# Recipe:: default
#
# Copyright:: 2017, The Authors, All Rights Reserved.
include_recipe 'mifostwo::java'
include_recipe 'mifostwo::usergroups'
include_recipe 'mifostwo::download'
include_recipe 'mifostwo::extract'
include_recipe 'mifostwo::permissins'
include_recipe 'mifostwo::start'
include_recipe 'mifostwo::upstart'
include_recipe 'mifostwo::deploywar'
include_recipe 'mifostwo::mysqlinstall'
include_recipe 'mifostwo::appserverjar'
#include_recipe 'mifostwo::appserconfig'
include_recipe 'mifostwo::deploywar'
