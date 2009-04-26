require 'rubygems/command'
require 'rubygems/dependency'

class Gem::Commands::OpenCommand < Gem::Command
  def initialize
    super 'open', "Opens the gem's source directory with $EDITOR"
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
    
    editor = ENV['EDITOR']
    if !editor
      say "no editor set in $EDITOR"
    else
      system(editor, path)
    end
  end
  
end