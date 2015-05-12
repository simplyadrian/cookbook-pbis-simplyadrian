#
# Cookbook Name:: pbis-simplyadrian
# Recipe:: default
#
# Copyright 2014, simplyadrian 
#
# All rights reserved - Do Not Redistribute
#

# Install autofs for mounting home directories.
case node[:platform]
when 'debian','ubuntu'
  package 'autofs-ldap'
  package 'ldap-utils'
when 'redhat','centos','fedora','amazon'
  package 'autofs'
end

# Reload autofs service
service "autofs" do
  supports :status => true, :start => true, :stop => true, :restart => true
  action [:enable, :start, :reload]
end

include_recipe	"pbis-simplyadrian::installpbis"
include_recipe  "pbis-simplyadrian::joindomain"
include_recipe  "pbis-simplyadrian::updatedns"
