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

    spec_tuples = specs.map do |spec|
      [spec.name, spec.version, spec.original_platform, spec]
    end
    
    say spec_tuples.inspect
  end
  
end