#
# Cookbook Name:: nativex-pbis
# Recipe:: joindomain.rb
#
# Copyright 2014, NativeX
#
# All rights reserved - Do Not Redistribute
#

ad = Chef::EncryptedDataBagItem.load("credentials", "ad")
bash "pbis join domain" do
  user "root"
  code <<-EOH
  (domainjoin-cli join "#{node['nativex-pbis']['domain_name']}" ad["ad_username"] ad["ad_password"])
  EOH
end
