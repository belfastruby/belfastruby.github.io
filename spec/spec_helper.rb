# frozen_string_literal: true

require 'capybara/rspec'
require 'pry'
require 'rack/jekyll'
require 'rack/test'
require 'rspec'
require 'selenium-webdriver'

module CapybaraSetup
  extend self

  def configure_capybara
    setup_chrome_driver
    set_capybara_drivers
    set_capybara_defaults
    configure_jekyll_for_capybara
  end

  private

  def setup_chrome_driver
    Capybara.register_driver :chrome do |app|
      options = chrome_options
      Capybara::Selenium::Driver.new(app, browser: :chrome, options:)
    end
  end

  def chrome_options
    Selenium::WebDriver::Chrome::Options.new(args: chrome_args)
  end

  def chrome_args
    %w[headless disable-gpu disable-dev-shm-usage window-size=1400,1400]
  end

  def set_capybara_drivers
    Capybara.javascript_driver = :chrome
    Capybara.default_driver = :chrome
  end

  def set_capybara_defaults
    Capybara.default_max_wait_time = 5
    Capybara.app_host = ENV.fetch('APP_URL', 'http://localhost:3333')
    Capybara.server_host = '0.0.0.0'
    Capybara.server_port = '3333'
  end

  def configure_jekyll_for_capybara
    Capybara.app = Rack::Jekyll.new(force_build: true)
    wait_for_jekyll_build
  end

  def wait_for_jekyll_build
    while Capybara.app.compiling?
      puts 'Application compiling...'
      sleep 1
    end
  end
end

RSpec.configure do |config|
  config.expect_with :rspec do |expectations|
    expectations.syntax = :expect
  end

  CapybaraSetup.configure_capybara
end
