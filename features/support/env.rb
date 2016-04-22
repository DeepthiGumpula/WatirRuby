require 'rspec'
require 'rspec/expectations'
require 'watir-webdriver'

require 'rspec'
require 'rspec/expectations'
require 'watir-webdriver'
require 'Faker'
require 'selenium-webdriver'
require 'clipboard'
require 'yaml'
require 'nokogiri'
require 'open-uri'
require 'zip'
require 'rubyXL'

if ENV['HEADLESS']
  require 'headless'
  headless = Headless.new
  headless.start
  at_exit do
    headless.destroy
  end
end

