#
# Cookbook Name:: pbis-simplyadrian
# Recipe:: installpbis.rb
#
# Copyright 2014, simplyadrian
#
# All rights reserved - Do Not Redistribute
#

%w{pbis-enterprise pbis-enterprise-upgrade}.each do |pkg|
  package pkg do
    action :install
    options "--nogpgcheck"
  end
end
