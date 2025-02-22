source "https://rubygems.org"

ruby "3.3.0"

# Bundle edge Rails instead: gem "rails", github: "rails/rails", branch: "main"
gem "rails", "~> 7.1.4"

# Use postgresql as the database for Active Record
gem "pg", "~> 1.1"

# Use the Puma web server [https://github.com/puma/puma]
gem "puma", ">= 5.0"

# Build JSON APIs with ease [https://github.com/rails/jbuilder]
gem "jbuilder"

# Use Active Model has_secure_password [https://guides.rubyonrails.org/active_model_basics.html#securepassword]
gem "bcrypt", "~> 3.1.7"

# A pure ruby implementation of the RFC 7519 OAuth JSON Web Token (JWT) standard.
gem "jwt", "2.9.3"

# ActiveModel validation for email. Including MX lookup and disposable email blacklist
gem "valid_email2", "~> 5.3.0"

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem "tzinfo-data", platforms: %i[windows jruby]

# Reduces boot times through caching; required in config/boot.rb
gem "bootsnap", require: false

# Use Active Storage variants [https://guides.rubyonrails.org/active_storage_overview.html#transforming-images]
# gem "image_processing", "~> 1.2"

# Use Rack CORS for handling Cross-Origin Resource Sharing (CORS), making cross-origin Ajax possible
# gem "rack-cors"

# Next-generation Ruby 3.2.1+ sampling profiler. Tracks multiple threads, GVL activity, GC pauses, idle time, and more.
# gem 'vernier', '~> 1.2'

# Simple, efficient background processing for Ruby.
# gem 'sidekiq', '~> 7.1'

group :development, :test do
  # See https://guides.rubyonrails.org/debugging_rails_applications.html#debugging-with-the-debug-gem
  gem "debug", platforms: %i[mri windows]
  gem "rspec-rails", "~> 7.0.0"

  # Runs your tests in a random timezone
  gem "zonebie", "~> 0.6.1"

  # Ruby Style Guide, with linter & automatic code fixer
  gem "standard", "~> 1.44"
end

group :development do
  # Speed up commands on slow machines / big apps [https://github.com/rails/spring]
  # gem "spring"
end
