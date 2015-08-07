require 'sinatra'

get '/' do
  File.read(File.join('public', 'index.html'))
end

get '/services' do
  File.read(File.join('public', 'services.html'))
end

post '/mail/contact_me.php' do
  File.read(File.join('public', 'mail', 'contact_me.php'))
end
