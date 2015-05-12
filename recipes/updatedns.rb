#
# Cookbook Name:: pbis-simplyadrian
# Recipe:: updatedns.rb
#
# Copyright 2014, simplyadrian
#
# All rights reserved - Do Not Redistribute
#

bash "pbis update dns" do
  code <<-EOH
  /opt/pbis/bin/update-dns
  EOH

end
