#
# Author:: René Oelke (<rene.oelke@foobugs.com>)
# Cookbook Name:: zend-optimizer-plus
# Recipe:: source
#
# Copyright 2013, foobugs Oelke & Eichner GbR
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

include_recipe "build-essential"

url = node['optimizer']['url']
version = node['optimizer']['version']
configure_options = node['optimizer']['configure_options'].join(" ")

#
# Download the source code
#
remote_file "#{Chef::Config[:file_cache_path]}/ZendOptimizerPlus-#{version}.tar.gz" do
  source "#{url}/#{version}.tar.gz"
  mode "0644"
end

#
# Build the extension
#
bash "Build ZendOptimizerPlus" do
  cwd Chef::Config[:file_cache_path]
  code <<-EOF
    tar -xzvf ZendOptimizerPlus-#{version}.tar.gz
    cd ZendOptimizerPlus-#{version}
    phpize
    ./configure #{configure_options}
    make
  EOF
end

#
# Install the extension
#
bash "Install ZendOptimizerPlus" do
  cwd Chef::Config[:file_cache_path]
  code <<-EOF
    cd ZendOptimizerPlus-#{version}
    cp modules/ZendOptimizerPlus.so #{node['optimizer']['extension_dir']}/ZendOptimizerPlus.so
    chmod 0644 #{node['optimizer']['extension_dir']}/ZendOptimizerPlus.so
  EOF
end

#
# Install config file
#
template "#{node['optimizer']['config_dir']}/ZendOptimizerPlus.ini" do
  source "ZendOptimizerPlus.ini.erb"
  owner "root"
  group "root"
  mode "0644"
end

#
# Clean source and build files
#
bash "Clean source and build files" do
  cwd Chef::Config[:file_cache_path]
  code <<-EOF
    rm -rf ZendOptimizerPlus-#{version}.tar.gz
    rm -rf ZendOptimizerPlus-#{version}
  EOF
end
