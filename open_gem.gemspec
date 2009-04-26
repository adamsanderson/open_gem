# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = %q{open_gem}
  s.version = "0.0.0"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Adam Sanderson"]
  s.date = %q{2009-04-25}
  s.description = %q{Easily open a ruby gem with the editor of your choice.}
  s.email = %q{netghost@gmail.com}
  s.extra_rdoc_files = [
    "README.markdown"
  ]
  s.files = [
    "README.markdown",
    "Rakefile",
    "lib/rubygems/commands/open_command.rb",
    "lib/rubygems_plugin.rb"
  ]
  s.has_rdoc = true
  s.homepage = %q{http://github.com/adamsanderson/open_gem}
  s.rdoc_options = ["--charset=UTF-8"]
  s.require_paths = ["lib"]
  s.rubygems_version = %q{1.3.2}
  s.summary = %q{Easily open a ruby gem with the editor of your choice.}

  if s.respond_to? :specification_version then
    current_version = Gem::Specification::CURRENT_SPECIFICATION_VERSION
    s.specification_version = 3

    if Gem::Version.new(Gem::RubyGemsVersion) >= Gem::Version.new('1.2.0') then
    else
    end
  else
  end
end
