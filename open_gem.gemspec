# Generated by jeweler
# DO NOT EDIT THIS FILE DIRECTLY
# Instead, edit Jeweler::Tasks in Rakefile, and run the gemspec command
# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = %q{open_gem}
  s.version = "1.4.2"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Adam Sanderson"]
  s.date = %q{2010-04-23}
  s.description = %q{      Open a gem's source directory with either the default editor, or a specified command.
}
  s.email = %q{netghost@gmail.com}
  s.extra_rdoc_files = [
    "README.markdown"
  ]
  s.files = [
    "CHANGELOG.markdown",
     "README.markdown",
     "Rakefile",
     "VERSION.yml",
     "lib/open_gem/common_options.rb",
     "lib/rubygems/commands/open_command.rb",
     "lib/rubygems/commands/read_command.rb",
     "lib/rubygems/commands/shell_command.rb",
     "lib/rubygems_plugin.rb",
     "test/open_command_test.rb"
  ]
  s.has_rdoc = false
  s.homepage = %q{http://github.com/adamsanderson/open_gem}
  s.rdoc_options = ["--charset=UTF-8"]
  s.require_paths = ["lib"]
  s.rubyforge_project = %q{opengem}
  s.rubygems_version = %q{1.3.6}
  s.summary = %q{Gem Command to easily open a ruby gem with the editor of your choice.}
  s.test_files = [
    "test/open_command_test.rb"
  ]

  if s.respond_to? :specification_version then
    current_version = Gem::Specification::CURRENT_SPECIFICATION_VERSION
    s.specification_version = 3

    if Gem::Version.new(Gem::RubyGemsVersion) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<launchy>, ["~> 0.3.5"])
      s.add_development_dependency(%q<mocha>, ["~> 0.9.5"])
    else
      s.add_dependency(%q<launchy>, ["~> 0.3.5"])
      s.add_dependency(%q<mocha>, ["~> 0.9.5"])
    end
  else
    s.add_dependency(%q<launchy>, ["~> 0.3.5"])
    s.add_dependency(%q<mocha>, ["~> 0.9.5"])
  end
end

