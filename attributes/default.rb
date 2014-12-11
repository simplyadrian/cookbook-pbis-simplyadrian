# Domain Name
default['pbis-nativex']['domain_name'] = 'teamfreeze.com'
#OU
case node['aws']['region']
when 'us-east-1'
	then default['pbis-nativex']['ou'] = "OU=Linux,OU=#{node['aws']['region']},OU=AWS Servers,OU=Computer Accounts,DC=teamfreeze,DC=com"
when 'us-west-1'
	then default['pbis-nativex']['ou'] = "OU=Linux,OU=#{node['aws']['region']},OU=AWS Servers,OU=Computer Accounts,DC=teamfreeze,DC=com"
when 'us-west-2'
	then default['pbis-nativex']['ou'] = "OU=Linux,OU=#{node['aws']['region']},OU=AWS Servers,OU=Computer Accounts,DC=teamfreeze,DC=com"
else
	puts "Unknown region or OU"
end