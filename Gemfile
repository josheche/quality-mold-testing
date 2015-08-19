source "https://rubygems.org"

ruby "2.2.2"

gem "sinatra"
gem "pony"

gem 'capistrano3-nginx'
gem 'capistrano'
gem 'capistrano-rbenv'
gem 'capistrano-bundler'

gem 'sinatra-assetpack', '~> 0.3.3'

group :developer do
  gem 'thin'
  gem 'capistrano3-unicorn'
end

group :production do
  gem 'unicorn'
end