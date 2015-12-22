require 'spree_core'
module Solidus
  module FileImport
    def self.import_file(file)
      path = File.expand_path(File.join(Rails.root, 'input', "#{file}.rb"))
      # Check to see if the specified file has been loaded before
      if !$LOADED_FEATURES.include?(path)
        require path
        puts "Loaded #{file.titleize}"
      end
    end
  end
end
