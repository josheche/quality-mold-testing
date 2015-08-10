require 'sinatra'
require 'pony'

get '/' do
  File.read(File.join('public', 'index.html'))
end

get '/services' do
  File.read(File.join('public', 'services.html'))
end

post '/send' do
end
