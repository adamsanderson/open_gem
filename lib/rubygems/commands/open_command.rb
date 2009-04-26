require 'rubygems/command'
require 'rubygems/dependency'

class Gem::Commands::OpenCommand < Gem::Command
  def initialize
    super 'open', "Opens the gem's source directory with $EDITOR", :command => nil
    add_option('-c', '--command COMMAND',
               'Execute command at path of the rubygem') do |value, options|
      options[:command] = value
    end
  end
  
  def arguments # :nodoc:
    "GEMNAME       gem to open"
  end

  def execute    
    name = get_one_gem_name
    
    dep = Gem::Dependency.new name, Gem::Requirement.default
    specs = Gem.source_index.search dep
    
    # TODO: ask which to open:
    path = specs.last.full_gem_path
    
    editor = options[:command] || ENV['EDITOR']
    if !editor
      say "Either set $EDITOR, or use -c <command_name>"
    else
      system(editor, path)
    end
  end
  
end