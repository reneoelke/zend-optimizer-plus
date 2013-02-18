#
# Author:: René Oelke (<rene.oelke@foobugs.com>)
# Cookbook Name:: zend-optimizer-plus
# Attribute:: default
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

default['optimizer']['install_method'] = 'source'

default['optimizer']['url'] = 'https://github.com/zend-dev/ZendOptimizerPlus/archive'
default['optimizer']['version'] = 'master'
default['optimizer']['configure_options'] = %W{
  --enable-optimizer-plus
}

default['optimizer']['extension_dir'] = '/usr/lib/php5/20090626'
default['optimizer']['config_dir'] = '/etc/php5/conf.d'

default['optimizer']['config_enable']                  = '1'
default['optimizer']['config_enable_cli']              = '1'
default['optimizer']['config_memory_consumption']      = '128'
default['optimizer']['config_interned_strings_buffer'] = '8'
default['optimizer']['config_max_accelerated_files']   = '4000'
default['optimizer']['config_max_wasted_percentage']   = '5'
default['optimizer']['config_use_cwd']                 = '1'
default['optimizer']['config_validate_timestamps']     = '1'
default['optimizer']['config_revalidate_freq']         = '60'
default['optimizer']['config_revalidate_path']         = '0'
default['optimizer']['config_save_comments']           = '1'
default['optimizer']['config_load_comments']           = '1'
default['optimizer']['config_fast_shutdown']           = '1'
default['optimizer']['config_enable_file_override']    = '0'
default['optimizer']['config_optimization_level']      = '0xffffffff'
default['optimizer']['config_inherited_hack']          = '1'
default['optimizer']['config_dups_fix']                = '0'
default['optimizer']['config_blacklist_filename']      = ''
default['optimizer']['config_consistency_checks']      = '0'
default['optimizer']['config_force_restart_timeout']   = '180'
default['optimizer']['config_error_log']               = ''
default['optimizer']['config_log_verbosity_level']     = '1'
default['optimizer']['config_preferred_memory_model']  = ''
default['optimizer']['config_protect_memory']          = '0'
