require 'rubygems/command_manager'

require 'rubygems/command'
require 'rubygems/dependency'
require 'rubygems/version_option'

require 'shellwords'
require File.expand_path('../open_gem/common_options', __FILE__)

Gem::CommandManager.instance.register_command :open
Gem::CommandManager.instance.register_command :read