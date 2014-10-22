#
# Cookbook Name:: pbis-nativex
# Recipe:: default
#
# Copyright 2014, NativeX 
#
# All rights reserved - Do Not Redistribute
#

include_recipe	"pbis-nativex::installpbis"
include_recipe  "pbis-nativex::joindomain"
include_recipe  "pbis-nativex::updatedns"
