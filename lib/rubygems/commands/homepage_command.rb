require 'launchy'
# HomepageCommand will open the homepage of a gem in your browser.
class Gem::Commands::HomepageCommand < Gem::Command
  include OpenGem::CommonOptions
  include Gem::VersionOption

  def initialize
    super 'homepage', "Opens the gem's homepage.",
      :command => nil,
      :version=>  Gem::Requirement.default,
      :latest=>   false

    add_command_option "Application to view homepage with"
    add_latest_version_option
    add_version_option
    add_exact_match_option
  end

  def arguments # :nodoc:
    "GEMNAME       gem whose homepage you want to open"
  end

  def execute
    name = get_one_gem_name
    spec = get_spec(name)
    Launchy::Browser.run(spec.homepage)
  end

end

