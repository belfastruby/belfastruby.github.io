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

  chrome_headless_capabilities = Selenium::WebDriver::Remote::Capabilities.chrome(
    chromeOptions: {
      args: %w(
        no-sandbox
        headless
        disable-gpu
        window-size=1400,1400
      )
    }
  )

  Capybara.register_driver :remote do |app|
    Capybara::Selenium::Driver.new(
      app,
      browser: :remote,
      url: ENV['SELENIUM_URL'],
      desired_capabilities: chrome_headless_capabilities
    )
  end

  Capybara.register_driver :headless_chrome do |app|
    Capybara::Selenium::Driver.new(
      app,
      browser: :chrome,
      desired_capabilities: chrome_headless_capabilities
    )
  end

  # If the selenium url is present, i.e. when running in docker, configure
  # the remote selenium driver, otherwise run with headless chrome instead
  if ENV['SELENIUM_URL']
    Capybara.javascript_driver = :remote
    Capybara.default_driver = :remote
  else
    Capybara.javascript_driver = :headless_chrome
    Capybara.default_driver = :headless_chrome
  end
  Capybara.default_max_wait_time = 5
  Capybara.app_host = ENV.fetch('APP_URL', 'http://localhost:3333')
  Capybara.server_host = '0.0.0.0'
  Capybara.server_port = '3333'

  # Configure Capybara to load the website through rack-jekyll.
  # (force_build: true) builds the site before the tests are run,
  # so our tests are always running against the latest version
  # of our jekyll site.
  Capybara.app = Rack::Jekyll.new(force_build: true)
  while Capybara.app.compiling?
    puts 'Application compiling...'
    sleep 1
  end
end
