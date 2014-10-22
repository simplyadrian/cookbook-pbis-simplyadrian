#
# Cookbook Name:: pbis-nativex
# Recipe:: updatedns.rb
#
# Copyright 2014, NativeX
#
# All rights reserved - Do Not Redistribute
#

bash "pbis update dns" do
  code <<-EOH
  /opt/pbis/bin/update-dns
  EOH

end
