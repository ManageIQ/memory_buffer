require "bundler/gem_tasks"

require 'rake/extensiontask'
Rake::ExtensionTask.new do |ext|
  ext.name    = 'memory_buffer'
  ext.ext_dir = 'ext/memory_buffer'
  ext.lib_dir = 'lib/memory_buffer'
end

require "rspec/core/rake_task"
RSpec::Core::RakeTask.new(:spec => :compile)

task :default => :spec
