require 'sinatra'
require 'pony'

get '/' do
  File.read(File.join('public', 'index.html'))
end

get '/services' do
  File.read(File.join('public', 'services.html'))
end

post '/send' do
  content_type :json

  # Define your message parameters
  begin
    Pony.mail(:to => 'descarda@qualitymoldtesting.com', :html_body => "<ul><li>Name: #{params['name']},</li> <li>Email: #{params['email']},</li> <li>Message: #{params['message']}</li>", :body => "In case you can't read HTML: Name: #{params['name']}, Email: #{params['email']}, Message: #{params['message']}")

    { :status => '200' }.to_json
  rescue Exception => e
    { :status => '500' }.to_json
  end

end
