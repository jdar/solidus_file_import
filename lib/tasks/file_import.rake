require 'ffaker'
require 'pathname'
$:.unshift((Rails.root+"file_import/lib").to_s)
require 'solidus_file_import'

namespace :solidus_file_import do
  desc 'Populates some example data that could be modified for file import'
  task :samples => :environment do
  	if File.exist?(Dir['input/*'].first.to_s)
      puts %Q{
Please delete 'input' directory before running 'rake solidus_file_import:samples' to create an input directory.
      }
      exit(1)
    end
  	samples_path = Pathname.new(File.dirname(__FILE__)).realpath
    FileUtils.cp_r samples_path+'../../db/samples', "./input"
  end
  require 'pry'
  binding.pry
  desc 'Loads file_import data'
  task({:load => :environment} => [:force]) do |t,args|
    unless File.exist?(Dir['input/*'].first.to_s)
      puts %Q{
Please run 'rake solidus_file_import:samples' to create an input directory with dummy files.
      }
      exit(1)
    end
    everything_checked_in = `(cd #{Rails.root.realpath} && git diff input)`.empty?
    if everything_checked_in || args[:force]
      SolidusFileImport::Engine.load_all
    else
      puts %Q{
Not checked in to git!
ADVANCED USERS:  'rake solidus_file_import:load --force'
      }
      exit(1)
    end

  end
end


