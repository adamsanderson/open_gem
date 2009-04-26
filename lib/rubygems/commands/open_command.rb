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
    
    if specs.length == 0
      say "Could not find '#{name}'"
      
    elsif specs.length == 1
      path = specs.last.full_gem_path
      
    else
      choices = specs.map{|s|"#{s.name} #{s.version}"}
      c,i = choose_from_list "Open which gem?", choices
      path = specs[i].full_gem_path if i
      
    end
    
    open_gem(path) if path
  end
  
  private
  def open_gem(path)
    editor = options[:command] || ENV['EDITOR']
    if !editor
      say "Either set $EDITOR, or use -c <command_name>"
    else
      system(editor, path)
    end
  end
end