#
# Cookbook Name:: pbis-nativex
# Recipe:: installpbis.rb
#
# Copyright 2014, NativeX
#
# All rights reserved - Do Not Redistribute
#

%w{pbis-enterprise pbis-enterprise-upgrade}.each do |pkg|
  package pkg do
    action :install
    options "--nogpgcheck"
  end
end
