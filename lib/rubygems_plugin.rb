require 'rubygems/command_manager'

require 'rubygems/command'
require 'rubygems/dependency'
require 'rubygems/version_option'

require 'shellwords'
require 'open_gem/common_options'

Gem::CommandManager.instance.register_command :open
Gem::CommandManager.instance.register_command :read