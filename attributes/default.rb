# Domain Name
default['pbis-simplyadrian']['domain_name'] = 'simplyadrian.com'
# OU individual components
default['pbis-simplyadrian']['domain_component_level_0'] = 'com'
default['pbis-simplyadrian']['domain_component_level_1'] = 'simplyadrian'
default['pbis-simplyadrian']['organizational_unit_level_0'] = 'Computer Accounts'
default['pbis-simplyadrian']['organizational_unit_level_1'] = 'AWS Servers'
default['pbis-simplyadrian']['organizational_unit_level_2'] = 'UnknownRegion'
default['pbis-simplyadrian']['organizational_unit_level_3'] = 'Linux'
default['pbis-simplyadrian']['organizational_unit_level_4'] = "#{node.chef_environment.split('-').last}"
default['pbis-simplyadrian']['organizational_unit_level_5'] = 'One Off Servers'
#Full OU path
default['pbis-simplyadrian']['oupath'] = "OU=#{node['pbis-simplyadrian']['organizational_unit_level_5']},"\
                                    "OU=#{node['pbis-simplyadrian']['organizational_unit_level_4']},"\
                                    "OU=#{node['pbis-simplyadrian']['organizational_unit_level_3']},"\
                                    "OU=#{node['pbis-simplyadrian']['organizational_unit_level_2']},"\
                                    "OU=#{node['pbis-simplyadrian']['organizational_unit_level_1']},"\
                                    "OU=#{node['pbis-simplyadrian']['organizational_unit_level_0']},"\
                                    "DC=#{node['pbis-simplyadrian']['domain_component_level_1']},"\
                                    "DC=#{node['pbis-simplyadrian']['domain_component_level_0']}"
