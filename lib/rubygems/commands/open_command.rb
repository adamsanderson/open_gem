require 'rubygems/command'
require 'rubygems/dependency'
require 'rubygems/version_option'

# OpenCommand will open a gem's source path
class Gem::Commands::OpenCommand < Gem::Command
  include Gem::VersionOption
  
  def initialize
    super 'open', "Opens the gem's source directory with $GEM_OPEN_EDITOR or $EDITOR", 
      :command => nil, 
      :version=>  Gem::Requirement.default,
      :latest=>   false
    
    add_option('-c', '--command COMMAND',
               'Execute command at path of the rubygem') do |value, options|
      options[:command] = value
    end
    
    add_option('-l', '--latest',
               'If there are multiple versions, open the latest') do |value, options|
      options[:latest] = true
    end
    
    add_version_option
  end
  
  def arguments # :nodoc:
    "GEMNAME       gem to open"
  end

  def execute
    name = get_one_gem_name
    path = get_path(name)
    
    open_gem(path) if path
  end
  
  def get_path(name)
    dep = Gem::Dependency.new name, options[:version]
    specs = Gem.source_index.search dep
    
    if specs.length == 0
      say "Could not find '#{name}'"
      return nil
      
    elsif specs.length == 1 || options[:latest]
      return specs.last.full_gem_path
      
    else
      choices = specs.map{|s|"#{s.name} #{s.version}"}
      c,i = choose_from_list "Open which gem?", choices
      return specs[i].full_gem_path if i
      
    end
  end

  def open_gem(path)
    editor = options[:command] || ENV['GEM_OPEN_EDITOR'] || ENV['EDITOR']
    if !editor
      say "Either set $EDITOR, or use -c <command_name>"
    else
      system(editor, path)
    end
  end
end