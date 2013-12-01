#
# Cookbook Name:: medusa
# Attributes:: medusa
#
# Copyright (C) 2013 Jonathan Werrett
# 
# All rights reserved - Do Not Redistribute
#

default['medusa']['version'] = '2.1.1' 
default['medusa']['binary'] = '/usr/local/bin/medusa'
default['medusa']['url'] = "http://www.foofus.net/jmk/tools/medusa-#{node['medusa']['version']}.tar.gz"


default['libssh2']['version'] = '1.4.3' 
default['libssh2']['url'] = "http://www.libssh2.org/download/libssh2-#{node['libssh2']['version']}.tar.gz"

