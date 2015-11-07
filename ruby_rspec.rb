require 'fileutils'

def configure_gemfile
  gemfile = File.read('Gemfile')
  gems = ['rspec-rails', 'capybara', 'shoulda', 'database_cleaner', 'factory_girl_rails', 'rspec-collection_matchers', 'poltergeist', 'launchy']
  gems.each { |gem|
    gemfile.gsub!(":test do", ":test do\n  gem '#{gem}'") unless gemfile.include?(gem)
  }
  File.open('Gemfile', "w") { |file|
    file << gemfile
    p 'gems completed'
  }

  p `bundle install`
  p `rails generate rspec:install` unless File.exist?('spec')

  rails_helper = File.read('spec/rails_helper.rb')
  requires = ['rspec/rails', 'capybara/rails', 'capybara/poltergeist', 'support/database_cleaner', 'support/factory_girl']
  poltergeist_setting = 'Capybara.javascript_driver = :poltergeist'
  requires.each { |gem|
  rails_helper.gsub!("'spec_helper'", "'spec_helper'\n#{poltergeist_setting}") unless rails_helper.include?(poltergeist_setting)
    rails_helper.gsub!("'spec_helper'", "'spec_helper'\nrequire '#{gem}'") unless rails_helper.include?(gem)
  }
  rails_helper.gsub!("transactional_fixtures = true", "transactional_fixtures = false")
  File.open('spec/rails_helper.rb', "w") { |file|
    file << rails_helper
    p 'requires completed'
  }
end

def configure_database_cleaner
  source =  File.expand_path('support', File.dirname(__FILE__))
  dest = File.join(Dir.pwd, 'spec')
  FileUtils.cp_r(source, dest)
  Dir.mkdir(File.join(Dir.pwd, 'spec', 'factories'))
end

configure_gemfile
configure_database_cleaner

