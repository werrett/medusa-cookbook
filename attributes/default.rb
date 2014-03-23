#
# Cookbook Name:: medusa
# Attributes:: medusa
#
# Copyright (C) 2014 Jonathan Werrett
#
# All rights reserved - Do Not Redistribute
#

default['medusa']['version'] = '2.1.1'
default['medusa']['binary'] = '/usr/local/bin/medusa'
default['medusa']['url'] = "http://www.foofus.net/jmk/tools/medusa-#{node['medusa']['version']}.tar.gz"

default['medusa']['configure_options'] = ''
default['medusa']['make_options']      = ''
default['medusa']['install_options']   = ''

default['libssh2']['version'] = '1.4.3'
default['libssh2']['url'] = "http://www.libssh2.org/download/libssh2-#{node['libssh2']['version']}.tar.gz"

# Forces libssh2 in /usr so Medusa can find it.
default['libssh2']['configure_options'] = '--prefix=/usr'
default['libssh2']['make_options']      = ''
default['libssh2']['install_options']   = ''
