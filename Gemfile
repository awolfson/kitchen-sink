source 'https://rubygems.org'
ruby '2.3.1'

gem 'rails', '5.0.0'
gem 'sqlite3'
gem 'haml-rails'
gem 'jquery-rails'
gem 'awesome_print'

group :assets do
  gem 'sass-rails'
  gem 'coffee-rails'

  # See https://github.com/sstephenson/execjs#readme for more supported runtimes
  # gem 'therubyracer', :platforms => :ruby

  gem 'uglifier', '>= 1.0.3'
end

group :development do
  gem 'spring'
  gem 'better_errors'
  gem 'binding_of_caller'
  gem 'meta_request'
  gem 'spring-commands-rspec'
  gem 'annotate'
  gem 'thin'
  gem 'rubocop', require: false
  gem 'pry-rails'
end

group :test do
  gem 'shoulda-matchers'
  gem 'fuubar'
  gem 'capybara'
end

group :development, :test do
  gem 'rspec', '~> 3.5.0.beta1'
  gem 'rspec-core', '~> 3.5.0.beta1'
  gem 'rspec-rails', '~> 3.5.0.beta1'
  gem 'guard-rspec', '~> 4.6', require: false
  gem 'rails-controller-testing'
  gem 'factory_girl_rails'
end

group :production do
  gem 'rails_12factor'
end
