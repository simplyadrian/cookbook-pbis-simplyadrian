#
# Cookbook Name:: pbis-nativex
# Recipe:: joindomain.rb
#
# Copyright 2014, NativeX
#
# All rights reserved - Do Not Redistribute
#

bash "pbis update dns" do
  code <<-EOH
  update-dns
  EOH

end
