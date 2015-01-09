# Domain Name
default['pbis-nativex']['domain_name'] = 'teamfreeze.com'
# OU individual components
default['pbis-nativex']['domain_component_level_0'] = 'com'
default['pbis-nativex']['domain_component_level_1'] = 'teamfreeze'
default['pbis-nativex']['organizational_unit_level_0'] = 'Computer Accounts'
default['pbis-nativex']['organizational_unit_level_1'] = 'AWS Servers'
default['pbis-nativex']['organizational_unit_level_2'] = 'UnknownRegion'
default['pbis-nativex']['organizational_unit_level_3'] = 'Linux'
default['pbis-nativex']['organizational_unit_level_4'] = "#{node.chef_environment}"
default['pbis-nativex']['organizational_unit_level_5'] = 'One Off Servers'
#Full OU path
default['pbis-nativex']['oupath'] = "OU=#{node['pbis-nativex']['organizational_unit_level_5']},"\
                                    "OU=#{node['pbis-nativex']['organizational_unit_level_4']},"\
                                    "OU=#{node['pbis-nativex']['organizational_unit_level_3']},"\
                                    "OU=#{node['pbis-nativex']['organizational_unit_level_2']},"\
                                    "OU=#{node['pbis-nativex']['organizational_unit_level_1']},"\
                                    "OU=#{node['pbis-nativex']['organizational_unit_level_0']},"\
                                    "DC=#{node['pbis-nativex']['domain_component_level_1']},"\
                                    "DC=#{node['pbis-nativex']['domain_component_level_0']}"
