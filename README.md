Description
===========

This cookbook installs and configures the PHP extension ZendOptimizerPlus. It includes recipes for installing from source (and [coming soon] from package).

---

Requirements
============

Chef
----

Version 1.0.0 and later of this cookbook requires Chef 10.14.2 or later.

Platforms
---------

Tested on:

* Ubuntu 12.04 (64 Bit)

May work on any other Ubuntu derivates or Debian distributions with or without modification.

Cookbooks
---------

* apt
* php
* build-essential (only for installation from source)

---

Recipes
=======

default
-------

Include the default recipe in a roles run list or in another recipe. By default `zend-optimizer-plus` will be installed from source. This can be changed by the attribute `install_method`.

source
------

This recipe installs ZendOptimizerPlus from source.

package (coming soon)
---------------------

This recipe installs ZendOptimizerPlus from packages.

---

Attributes
==========

Common
------
* `node['optimizer']['install_method']` - Installation method.
* `node['optimizer']['url']` - URL for downloading source code.
* `node['optimizer']['version']` - Version of source code to download.
* `node['optimizer']['configure_options']` - Configure options to build extension.
* `node['optimizer']['extension_dir']` - Path to PHP extensions.
* `node['optimizer']['config_dir']` - Path to PHP extension config files.

Extension configuration
-----------------------

* `node['optimizer']['config_enable']`
* `node['optimizer']['config_enable_cli']`
* `node['optimizer']['config_memory_consumption']`
* `node['optimizer']['config_interned_strings_buffer']`
* `node['optimizer']['config_max_accelerated_files']`
* `node['optimizer']['config_max_wasted_percentage']`
* `node['optimizer']['config_use_cwd']`
* `node['optimizer']['config_validate_timestamps']`
* `node['optimizer']['config_revalidate_freq']`
* `node['optimizer']['config_revalidate_path']`
* `node['optimizer']['config_save_comments']`
* `node['optimizer']['config_load_comments']`
* `node['optimizer']['config_fast_shutdown']`
* `node['optimizer']['config_enable_file_override']`
* `node['optimizer']['config_optimization_level']`
* `node['optimizer']['config_inherited_hack']`
* `node['optimizer']['config_dups_fix']`
* `node['optimizer']['config_blacklist_filename']`
* `node['optimizer']['config_consistency_checks']`
* `node['optimizer']['config_force_restart_timeout']`
* `node['optimizer']['config_error_log']`
* `node['optimizer']['config_log_verbosity_level']`
* `node['optimizer']['config_preferred_memory_model']`
* `node['optimizer']['config_protect_memory']`

---

Usage
=====

Simply include the recipe `zend-optimizer-plus` in a role or recipe and optionally set the needed attributes.

Example for role
----------------

	name "optimizer"
	description "Role for installing ZendOptimizerPlus."

	default_attributes({
	  "optimizer" => {
	    "extension_dir" => "/usr/lib/php5/20090626",
	    "config_dir" => "/etc/php5/conf.d",
	    "config_enable" => "1",
	    "config_enable_cli" => "1"
	  }
	})

	run_list(
	  "recipe[zend-optimizer-plus]"
	)

Example for recipe
------------------

	...
	node['optimizer']['extension_dir'] = '/usr/lib/php5/20090626'
	node['optimizer']['config_dir'] = '/etc/php5/conf.d'
	node['optimizer']['config_enable'] = '1'
	node['optimizer']['config_enable_cli'] = '1'

	include_recipe "zend-optimizer-plus"
	...

---

License and Author
==================

Author:: René Oelke (<rene.oelke@foobugs.com>)

Copyright:: 2013, foobugs Oelke & Eichner GbR (http://foobugs.com)

Licensed under the Apache License, Version 2.0 (the "License");
you may not use this file except in compliance with the License.
You may obtain a copy of the License at

    http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an "AS IS" BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and
limitations under the License.
