# frozen_string_literal: true

source 'https://rubygems.org'

ruby '3.3.0'

# Bundle edge Rails instead: gem "rails", github: "rails/rails", branch: "main"
gem 'rails', '~> 7.1.3', '>= 7.1.3.2'

# The original asset pipeline for Rails [https://github.com/rails/sprockets-rails]
gem 'sprockets-rails'

# Use postgresql as the database for Active Record
gem 'pg', '~> 1.1'

# Use the Puma web server [https://github.com/puma/puma]
gem 'puma', '>= 5.0'

# Use JavaScript with ESM import maps [https://github.com/rails/importmap-rails]
gem 'importmap-rails'

# Hotwire's SPA-like page accelerator [https://turbo.hotwired.dev]
gem 'turbo-rails'

# Hotwire's modest JavaScript framework [https://stimulus.hotwired.dev]
gem 'stimulus-rails'

# Use Tailwind CSS [https://github.com/rails/tailwindcss-rails]
gem 'tailwindcss-rails'

# Build JSON APIs with ease [https://github.com/rails/jbuilder]
gem 'jbuilder'

# Use Devise for user authentication [https://github.com/heartcombo/devise]
gem 'devise', '~> 4.9'

# Use Shire for file uploads, storage, and processing [https://github.com/shrinerb/shrine]
gem 'shrine', '~> 3.6'

# FastImage finds the size or type of an image given its uri by fetching as little as needed [https://github.com/sdsykes/fastimage]
gem 'fastimage', '~> 1.8', '>= 1.8.1'

# Use Redis adapter to run Action Cable in production
# gem "redis", ">= 4.0.1"

# Use Kredis to get higher-level data types in Redis [https://github.com/rails/kredis]
# gem "kredis"

# Use Active Model has_secure_password [https://guides.rubyonrails.org/active_model_basics.html#securepassword]
# gem "bcrypt", "~> 3.1.7"

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: %i[windows jruby]

# Reduces boot times through caching; required in config/boot.rb
gem 'bootsnap', require: false

# Use Active Storage variants [https://guides.rubyonrails.org/active_storage_overview.html#transforming-images]
gem 'image_processing', '~> 1.12.2'

# Simple mime type detection using magic numbers, filenames, and extensions [https://github.com/rails/marcel]
gem 'marcel', '~> 1.0'

group :development, :test do
  # See https://guides.rubyonrails.org/debugging_rails_applications.html#debugging-with-the-debug-gem
  gem 'debug'

  # Use RSpec for testing [https://github.com/rspec/rspec-rails]
  gem 'rspec-core', '~> 3.13'
  gem 'rspec-expectations', '~> 3.13'
  gem 'rspec-mocks', '~> 3.13'
  gem 'rspec-support', '~> 3.13'

  # Use Factories to create models in tests [https://github.com/thoughtbot/factory_bot]
  gem 'factory_bot_rails'
end

group :development do
  # Use console on exceptions pages [https://github.com/rails/web-console]
  gem 'web-console'

  # Use RSpec for testing [https://github.com/rspec/rspec-rails]
  gem 'rspec-rails', '~> 6.1'

  # Linter for Ruby code [https://github.com/Shopify/ruby-lsp and https://github.com/rubocop/rubocop]
  gem 'rubocop'
  gem 'rubocop-rails'
  gem 'rubocop-rspec'
  gem 'ruby-lsp'

  # Add speed badges [https://github.com/MiniProfiler/rack-mini-profiler]
  # gem "rack-mini-profiler"

  # Speed up commands on slow machines / big apps [https://github.com/rails/spring]
  # gem "spring"
end

group :test do
  # Use system testing [https://guides.rubyonrails.org/testing.html#system-testing]
  gem 'capybara'
  gem 'selenium-webdriver'
end
