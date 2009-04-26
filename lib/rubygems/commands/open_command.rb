require 'rubygems/command'
require 'rubygems/depdency'
class Gem::Commands::OpenCommand
  def initialize
    super 'open', "Opens the gem's source directory with $EDITOR"
  end

  def execute
    dep = Gem::Dependency.new name, Gem::Requirement.default
    specs = Gem.source_index.search dep

    spec_tuples = specs.map do |spec|
      [[spec.name, spec.version, spec.original_platform, spec], :local]
    end
    
    say spec_tuples.inspect
  end
  
end