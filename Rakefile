require 'rake'
require 'rake/testtask'
require 'rake/rdoctask'

begin
  require 'jeweler'
  Jeweler::Tasks.new do |s|
    s.name = "open_gem"
    s.description = "Gem Command to easily open a ruby gem with the editor of your choice."
    s.summary = "Gem Command to easily open a ruby gem with the editor of your choice."
    s.email = "netghost@gmail.com"
    s.homepage = "http://github.com/adamsanderson/open_gem"
    s.authors = ["Adam Sanderson"]
    s.has_rdoc = true
    s.extra_rdoc_files = ["README.markdown", "LICENSE.txt"]
    s.files = FileList["[A-Z]*", "{bin,lib,test}/**/*"]
  end

rescue LoadError
  puts "Jeweler not available. Install it for jeweler-related tasks with: sudo gem install technicalpickles-jeweler -s http://gems.github.com"
end

Rake::TestTask.new do |t|
  t.libs << 'lib'
  t.pattern = 'test/**/*_test.rb'
  t.verbose = false
end

Rake::RDocTask.new do |rdoc|
  rdoc.rdoc_dir = 'rdoc'
  rdoc.title    = 'test'
  rdoc.options << '--line-numbers' << '--inline-source'
  rdoc.rdoc_files.include('README*')
  rdoc.rdoc_files.include('lib/**/*.rb')
end

task :default => :test