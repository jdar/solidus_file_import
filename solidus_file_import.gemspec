# encoding: UTF-8
Gem::Specification.new do |s|
  s.platform    = Gem::Platform::RUBY
  s.name        = 'solidus_file_import'
  s.version     = '0.0.1'
  s.summary     = 'Import file data (including images) using the filesystem.'
  s.description = s.summary

  s.required_ruby_version = '>= 2.1.0'
  s.author      = 'Darius Roberts'
  s.email       = 'darius.roberts@gmail.com.com'
  s.homepage    = 'https://starosrewards.com'
  s.license     = %q{BSD-3}

  s.files        = `git ls-files`.split("\n")
  s.require_path = 'lib'
  s.requirements << 'none'

  #s.add_dependency 'solidus_core', >= 1.2.0.alpha  
end
