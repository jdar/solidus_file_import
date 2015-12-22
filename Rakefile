require 'rake'
require 'rake/testtask'
require 'rspec/core/rake_task'
require 'spree/testing_support/file_import_rake'

desc "Generates a dummy app for testing"
task :test_app do
  ENV['LIB_NAME'] = 'solidus/file_import'
  Rake::Task['common:test_app'].invoke
  Rake::Task['common:seed'].invoke
end

RSpec::Core::RakeTask.new
task :default => :spec
