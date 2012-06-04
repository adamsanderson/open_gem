require 'rake'
require 'rake/testtask'
require 'rdoc/task'

begin
  require 'jeweler'
  Jeweler::Tasks.new do |s|
    s.name = "open_gem"
    s.summary = "Gem Command to easily open a ruby gem with the editor of your choice."
    s.description = <<-DESC
      Open a gem's source directory with either the default editor, or a specified command.
    DESC
    s.email = "netghost@gmail.com"
    s.homepage = "http://github.com/adamsanderson/open_gem"
    s.rubyforge_project = "opengem"
    s.authors = ["Adam Sanderson"]
    s.has_rdoc = false
    s.files = FileList["[A-Z]*", "{bin,lib,test}/**/*"]
    
    # Testing
    s.test_files = FileList["test/**/*_test.rb"]
    s.add_dependency 'launchy', '~> 0.3.5'
    s.add_development_dependency 'mocha', '~> 0.9.5'
  end

rescue LoadError
  puts "Jeweler not available. Install it for jeweler-related tasks with: sudo gem install technicalpickles-jeweler -s http://gems.github.com"
end

Rake::TestTask.new do |t|
  t.libs << 'lib'
  t.pattern = 'test/**/*_test.rb'
  t.verbose = false
end

task :default => :test
