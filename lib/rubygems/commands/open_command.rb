# OpenCommand will open a gem's source path
class Gem::Commands::OpenCommand < Gem::Command
  include OpenGem::CommonOptions
  include Gem::VersionOption
  
  def initialize
    super 'open', "Opens the gem's source directory with $GEM_OPEN_EDITOR or $EDITOR", 
      :command => nil, 
      :version=>  Gem::Requirement.default,
      :latest=>   false
    
    add_command_option
    add_latest_version_option
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
      command_parts = Shellwords.shellwords(editor)
      command_parts << path
      success = system(*command_parts)
      if !success 
        raise Gem::CommandLineError, "Could not run '#{editor} #{path}', exit code: #{$?.exitstatus}"
      end
    end
  end
end