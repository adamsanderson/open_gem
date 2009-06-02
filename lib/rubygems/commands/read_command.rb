require 'shellwords'

require 'rubygems/command'
require 'rubygems/dependency'
require 'rubygems/version_option'

# OpenCommand will open a gem's source path
class Gem::Commands::ReadCommand < Gem::Command
  include Gem::VersionOption
  
  def initialize
    super 'read', "Opens the gem's documentation", 
      :command => 'open', 
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
    spec = get_spec name
    if spec
      path = get_path(spec)
      if File.exists? path
        read_gem path
      else
        say "The rdoc seems to be missing, TODO: generate"
      end
    end
  end
  
  def get_path(spec)
    File.join(spec.installation_path, "doc", spec.full_name, 'rdoc','index.html')
  end
  
  def get_spec(name)
    dep = Gem::Dependency.new name, options[:version]
    specs = Gem.source_index.search(dep).select{|spec| spec.has_rdoc?}
    
    if specs.length == 0
      say "Could not find docs for '#{name}'"
      return nil
      
    elsif specs.length == 1 || options[:latest]
      return specs.last
      
    else
      choices = specs.map{|s|"#{s.name} #{s.version}"}
      c,i = choose_from_list "Open which gem?", choices
      return specs[i] if i
      
    end
  end

  def read_gem(path)
    editor = options[:command]
    command_parts = Shellwords.shellwords(editor)
    command_parts << path
    success = system(*command_parts)
    if !success 
      raise Gem::CommandLineError, "Could not run '#{editor} #{path}', exit code: #{$?.exitstatus}"
    end
  end
  
end