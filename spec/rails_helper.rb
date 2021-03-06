require 'spec_helper'

ENV['RAILS_ENV'] ||= 'test'
require File.expand_path('../../config/environment', __FILE__)

require 'simplecov'
SimpleCov.start do
  add_filter "/spec"
end

abort("The Rails environment is running in production mode!") if Rails.env.production?
require 'rspec/rails'
require 'webmock/rspec'
require 'vcr'

VCR.configure do |config|
  config.allow_http_connections_when_no_cassette = true
  config.ignore_localhost = true
  config.cassette_library_dir = 'spec/cassettes'
  config.hook_into :webmock
  config.configure_rspec_metadata!
  config.filter_sensitive_data("petfinder_api_key") { ENV['petfinder_api_key'] }
  config.filter_sensitive_data("petfinder_api_secret") { ENV['petfinder_api_secret'] }
end

  begin
    ActiveRecord::Migration.maintain_test_schema!
  rescue ActiveRecord::PendingMigrationError => e
    puts e.to_s.strip
    exit 1
  end

RSpec.configure do |config|
  DatabaseCleaner.strategy = :truncation

    config.before(:all) do
      DatabaseCleaner.clean
    end
    config.after(:each) do
      DatabaseCleaner.clean
    end

  config.fixture_path = "#{::Rails.root}/spec/fixtures"
  config.include FactoryBot::Syntax::Methods
  config.use_transactional_fixtures = true

  config.infer_spec_type_from_file_location!

  config.filter_rails_from_backtrace!
end

Shoulda::Matchers.configure do |config|
  config.integrate do |with|
    with.test_framework :rspec

    with.library :rails
  end
end

def stub_pet_finder_one_pet
  stub_request(:get, "http://api.petfinder.com/pet.getRandom?format=json&key=#{ENV['petfinder_api_key']}&output=full").
  to_return(body: File.read("./spec/fixtures/random_pet.json"))
end

def stub_pet_finder_find_by_location
  stub_request(:get, "http://api.petfinder.com/pet.getRandom?format=json&key=#{ENV['petfinder_api_key']}&location=Denver, CO&output=full").
  to_return(body: File.read("./spec/fixtures/find_by_location.json"))
end

def stub_pet_finder_invalid_location
  stub_request(:get, "http://api.petfinder.com/pet.getRandom?format=json&key=#{ENV['petfinder_api_key']}&location=mier&output=full").
  to_return(body: File.read("./spec/fixtures/invalid_location.json"))
end

def stub_pet_finder_find_by_attributes
  stub_request(:get, "http://api.petfinder.com/pet.getRandom?format=json&key=#{ENV['petfinder_api_key']}&location=Denver, CO&size=S&animal=dog&count=10&age=Baby&output=fulloutput=full").
  to_return(body: File.read("./spec/fixtures/find_with_attributes.json"))
end
