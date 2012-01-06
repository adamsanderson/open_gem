# ShellCommand will open a shell in a gem's dir
class Gem::Commands::ShellCommand < Gem::Command
  include OpenGem::CommonOptions
  include Gem::VersionOption

  def initialize
    super 'shell', "Opens a shell in the gem's directory",
      :command => nil,
      :version=>  Gem::Requirement.default,
      :latest=>   false

    add_command_option
    add_latest_version_option
    add_version_option
    add_exact_match_option
  end

  def arguments # :nodoc:
    "GEMNAME       gem to read"
  end

  def execute
    name = get_one_gem_name
    path = get_path(name)

    shell_gem(path) if path
  end

  def get_path(name)
    if spec = get_spec(name)
      spec.full_gem_path
    end
  end

  def shell_gem(path)
    shell = options[:command] || ENV['GEM_OPEN_SHELL'] || ENV['SHELL']
    if !shell
      say "Either set $GEM_OPEN_SHELL, $SHELL, or use -c <command_name>"
    else
      command_parts = Shellwords.shellwords(shell)
      Dir.chdir(path)
      say "Working directory is #{path} - type exit to leave"
      success = system(*command_parts)
      if !success
        raise Gem::CommandLineError, "Could not run '#{shell} in #{path}', exit code: #{$?.exitstatus}"
      end
    end
  end
end
