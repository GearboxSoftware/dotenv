source "https://rubygems.org"
gemspec :name => "dotenv"
gemspec :name => "dotenv-rails"

group :guard do
  gem "guard-rspec"
  gem "guard-bundler"
  gem "rb-fsevent"
end

group :test do
  gem 'ci_reporter_rspec'
  gem 'simplecov', :require => false
end

platforms :rbx do
  gem "rubysl", "~> 2.0" # if using anything in the ruby standard library
end
