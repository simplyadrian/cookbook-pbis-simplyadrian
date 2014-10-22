#
# Cookbook Name:: pbis-nativex
# Recipe:: joindomain.rb
#
# Copyright 2014, NativeX
#
# All rights reserved - Do Not Redistribute
#

ad = Chef::EncryptedDataBagItem.load("credentials", "pbis")
bash "pbis join domain" do
  code <<-EOH
  if /opt/pbis/bin/get-status |grep "Status:        Unknown";
  then
    (domainjoin-cli join --ou "#{node['pbis-nativex']['ou']}" "#{node['pbis-nativex']['domain_name']}" #{ad["ad_username"]} #{ad["ad_password"]})
  else
    echo "Already joinded to Teamfreeze.com"
    exit 0
  fi
  EOH
end
