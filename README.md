pbis-nativex Cookbook
=====================
 - Install autofs for mounting home directories.
 - Installs pbis enterprise.
 - Joins node to domain and places node in appropriate OU.
 - Updates DNS servers on node.

Optionally using Ohai (ohai-nativex) attributes, determine the OU dynamically based on region, and set the cookbook
attribute value. Must include the pbis-nativex::dynamic_ou recipe.

Requirements
------------
#### cookbooks
- `ad-nativex` - TODO: Why?
- `ohai-nativex` - TODO: Why?

#### packages(redhat, centos, fedora , amazon)
- `autofs` - Installed by the default recipe. Used for mounting home directories.

#### packages(debian, ubuntu)
- `autofs-ldap` - Installed by the default recipe. Used for mounting home directories.
- `ldap-utils` - - Installed by the default recipe. Used for support of mounting home directories.


Recipes
-------
#### default.rb
Installs and reloads autofs.
Calls pbis-nativex::installpbis, pbis-nativex::joindomain, and pbis-nativex::updatedns

#### dynamic_ou.rb
Using Ohai (ohai-nativex) attributes, determine the OU dynamically based on region, and set the cookbook attribute value.

#### installpbis.rb
Installs the pbis enterprise package.

#### joindomain.rb
Joins node to domain and places the node in appropriate OU.

#### updatedns.rb
Updates DNS servers on the node.

Attributes
----------
#### pbis-nativex::default
<table>
  <tr>
    <th>Key</th>
    <th>Type</th>
    <th>Description</th>
    <th>Default</th>
  </tr>
  <tr>
    <td><tt>['pbis-nativex']['domain_name']</tt></td>
    <td>String</td>
    <td>Name of domain to join.</td>
    <td><tt>'teamfreeze.com'</tt></td>
  </tr>
  <tr>
    <td><tt>['pbis-nativex']['domain_component_level_0']</tt></td>
    <td>String</td>
    <td>Top level domain.</td>
    <td><tt>'com'</tt></td>
  </tr>
  <tr>
    <td><tt>['pbis-nativex']['domain_component_level_2']</tt></td>
    <td>String</td>
    <td>2nd level domain.</td>
    <td><tt>'teamfreeze'</tt></td>
  </tr>
  <tr>
    <td><tt>['pbis-nativex']['organizational_unit_level_0']</tt></td>
    <td>String</td>
    <td>Organizational level 0.</td>
    <td><tt>'Computer Accounts'</tt></td>
  </tr>
  <tr>
    <td><tt>['pbis-nativex']['organizational_unit_level_1']</tt></td>
    <td>String</td>
    <td>Organizational level 1.</td>
    <td><tt>'AWS Servers'</tt></td>
  </tr>
  <tr>
    <td><tt>['pbis-nativex']['organizational_unit_level_2']</tt></td>
    <td>String</td>
    <td>Organizational level 2.</td>
    <td><tt>'UnknownRegion'</tt></td>
  </tr>
  <tr>
    <td><tt>['pbis-nativex']['organizational_unit_level_3']</tt></td>
    <td>String</td>
    <td>Organizational level 3.</td>
    <td><tt>'Linux'</tt></td>
  </tr>
  <tr>
    <td><tt>['pbis-nativex']['organizational_unit_level_4']</tt></td>
    <td>String</td>
    <td>Organizational level 4.</td>
    <td><tt>"#{node.chef_environment}"</tt></td>
  </tr>
  <tr>
    <td><tt>['pbis-nativex']['organizational_unit_level_5']</tt></td>
    <td>String</td>
    <td>Organizational level 5.</td>
    <td><tt>'One Off Servers'</tt></td>
  </tr>
  <tr>
    <td><tt>['pbis-nativex']['oupath']</tt></td>
    <td>String</td>
    <td>Full path to the specified OU.</td>
    <td><tt>"OU=#{node['pbis-nativex']['organizational_unit_level_5']},"\
                                                "OU=#{node['pbis-nativex']['organizational_unit_level_4']},"\
                                                "OU=#{node['pbis-nativex']['organizational_unit_level_3']},"\
                                                "OU=#{node['pbis-nativex']['organizational_unit_level_2']},"\
                                                "OU=#{node['pbis-nativex']['organizational_unit_level_1']},"\
                                                "OU=#{node['pbis-nativex']['organizational_unit_level_0']},"\
                                                "DC=#{node['pbis-nativex']['domain_component_level_1']},"\
                                                "DC=#{node['pbis-nativex']['domain_component_level_0']}"</tt></td>
  </tr>
</table>

Usage
-----
#### pbis-nativex::default
Just include `pbis-nativex` in your node's `run_list`.
Override organizational level attribute in role cookbook:
node.default['pbis-nativex']['organizational_unit_level_5'] = "Predictive Analytics"

License and Authors
-------------------
Authors: Adrian Herrera
