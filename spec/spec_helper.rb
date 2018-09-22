# frozen_string_literal: true

require 'rspec'
require 'selenium-webdriver'
require 'capybara/rspec'
require 'rack/jekyll'
require 'rack/test'
require 'pry'

RSpec.configure do |config|
  config.expect_with :rspec do |expectations|
    expectations.syntax = :expect
  end
  # Configure JS Driver
  Capybara.javascript_driver = :selenium_chrome_headless
  # Configure Capybara to use Selenium.
  Capybara.register_driver :selenium do |app|
    # Configure selenium to use Chrome.
    Capybara::Selenium::Driver.new(app, :browser, :chrome)
  end

  # Configure Capybara to load the website through rack-jekyll.
  # (force_build: true) builds the site before the tests are run,
  # so our tests are always running against the latest version
  # of our jekyll site.
  Capybara.app = Rack::Jekyll.new(force_build: true)
end
