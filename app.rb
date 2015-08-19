class App < Sinatra::Base
  set :root, File.dirname(__FILE__) # You must set app root

  register Sinatra::AssetPack

  assets {
    serve '/js',     from: 'app/assets/javascripts'
    serve '/css',    from: 'app/assets/stylesheets'
    serve '/img', from: 'app/assets/images'

    css :application, '/css/application.css', [
      '/css/bootstrap.css',
      '/css/mold.css'
    ]

    js :app, '/js/app.js', [
      '/js/jquery.js',
      '/js/bootstrap.js',
      '/js/classie.js',
      '/js/cbpAnimatedHeader.js',
      '/js/jqBootstrapValidation.js',
      '/js/contact_me.js',
      '/js/mold.js'
    ]

    css_compression :simple
    js_compression  :jsmin
  }

  get '/' do
    erb :home
  end

  get '/services' do
    #File.read(File.join('public', 'services.html'))
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

end