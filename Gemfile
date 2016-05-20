source 'https://rubygems.org'
ruby '2.3.1'

gem 'rails', '5.0.0.rc1'

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
  gem 'guard-rspec', require: false
  gem 'spring-commands-rspec'
  gem 'annotate'
  gem 'thin'
  gem 'rubocop', require: false
end

group :test do
  gem 'rspec-rails'
  gem 'shoulda-matchers'
  gem 'fuubar'
end

group :production do
  gem 'rails_12factor'
end
