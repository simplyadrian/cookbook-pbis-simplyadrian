#
# Cookbook Name:: pbis-simplyadrian
# Recipe:: dynamic_ou 
#
# Copyright 2014, simplyadrian
#
# All rights reserved - Do Not Redistribute
#
# Description:: Using Ohai (ohai-simplyadrian) attributes, determine the OU dynamically based on region, and set the cookbook attribute value.

## NOT SURE IF WE REALLY NEED THIS
include_recipe "ohai-simplyadrian::default" if node['cloud']['provider'] == 'ec2'

ruby_block "determine_ec2_region_and_set_oupath" do
  block do
    if node['aws']['region']
      # Set the region in the tree, then rebuild the path.
      node.default['pbis-simplyadrian']['organizational_unit_level_2'] = node['aws']['region']
      node.default['pbis-simplyadrian']['oupath'] = "OU=#{node['pbis-simplyadrian']['organizational_unit_level_5']},"\
                                               "OU=#{node['pbis-simplyadrian']['organizational_unit_level_4']},"\
                                               "OU=#{node['pbis-simplyadrian']['organizational_unit_level_3']},"\
                                               "OU=#{node['pbis-simplyadrian']['organizational_unit_level_2']},"\
                                               "OU=#{node['pbis-simplyadrian']['organizational_unit_level_1']},"\
                                               "OU=#{node['pbis-simplyadrian']['organizational_unit_level_0']},"\
                                               "DC=#{node['pbis-simplyadrian']['domain_component_level_1']},"\
                                               "DC=#{node['pbis-simplyadrian']['domain_component_level_0']}"

      debugStr = "Set ['pbis-simplyadrian']['oupath'] to OU=#{node['pbis-simplyadrian']['organizational_unit_level_5']},"\
                                                   "OU=#{node['pbis-simplyadrian']['organizational_unit_level_4']},"\
                                                   "OU=#{node['pbis-simplyadrian']['organizational_unit_level_3']},"\
                                                   "OU=#{node['pbis-simplyadrian']['organizational_unit_level_2']},"\
                                                   "OU=#{node['pbis-simplyadrian']['organizational_unit_level_1']},"\
                                                   "OU=#{node['pbis-simplyadrian']['organizational_unit_level_0']},"\
                                                   "DC=#{node['pbis-simplyadrian']['domain_component_level_1']},"\
                                                   "DC=#{node['pbis-simplyadrian']['domain_component_level_0']}"
      Chef::Log.debug(debugStr)
    else
      Chef::Log.warn("Undefined AWS region! Cannot automatically set the proper OU Path.")
    end
  end
  action :run
  only_if { node['cloud']['provider'] == 'ec2' }
end
