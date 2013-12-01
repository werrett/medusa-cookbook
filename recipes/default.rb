#
# Cookbook Name:: medusa
# Recipe:: default
#
# Copyright (C) 2013 Jonathan Werrett
# 
# All rights reserved - Do Not Redistribute
#


package 'build-essential'

## Require librariers to support brute-forcing of all protocols.
package 'libncp-dev'
package 'libpcre3-dev'
package 'libpq-dev'
package 'libsvn-dev'
package 'libafpclient-dev'
package 'libgcrypt-dev'

## First Install libssh2

libssh2_src_file  = "#{Chef::Config['file_cache_path'] || '/tmp'}/libssh2-#{node['libssh2']['version']}.tar.gz"

libssh2_url = node['libssh2']['url'] ||
  "http://www.libssh2.org/download/libssh2-#{node['libssh2']['version']}.tar.gz"

remote_file libssh2_url do
  source   libssh2_url
  path     libssh2_src_file
  backup   false
  notifies :run, "bash[install_libssh2]", :immediately
end

bash "install_libssh2" do
  cwd  ::File.dirname(libssh2_src_file)
  user "root"

  code <<-EOH
    tar -zxf #{libssh2_src_file} -C #{::File.dirname(libssh2_src_file)}

    (cd libssh2-#{node['libssh2']['version']}/ && \
    ./configure --prefix=/usr && \
    make         && \
    make install )
  EOH
  
  action :nothing
  not_if "/sbin/ldconfig -p | grep -q libssh2.so"
end

## Next install medusa

medusa_src_file  = "#{Chef::Config['file_cache_path'] || '/tmp'}/medusa-#{node['medusa']['version']}.tar.gz"

medusa_url = node['medusa']['url'] ||
  "http://www.medusa.org/download/medusa-#{node['medusa']['version']}.tar.gz"

remote_file medusa_url do
  source   medusa_url
  path     medusa_src_file
  backup   false
  notifies :run, "bash[install_medusa]", :immediately
end

bash "install_medusa" do
  cwd  ::File.dirname(medusa_src_file)
  user "root"

  code <<-EOH
    tar -zxf #{medusa_src_file} -C #{::File.dirname(medusa_src_file)}

    (cd medusa-#{node['medusa']['version']}/ && \
    # Fix bug where afpclient directory was hardcoded.
    sed -si  's|/usr/lib/libafpclient.so.0|/usr/lib/x86_64-linux-gnu/libafpclient.so.0|' configure && \
    ./configure  && \
    make         && \
    make install )
  EOH
  
  action :nothing
  not_if "#{node['medusa']['binary']} -V | grep -q 'Medusa -v#{node['medusa']['version']}'"
end