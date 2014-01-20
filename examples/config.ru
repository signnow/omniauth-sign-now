require 'sinatra/base'
require 'omniauth-sign-now'
require 'multi_json'

class OmniauthSignNow < Sinatra::Base

  before do
    content_type 'application/json'
  end

  get '/' do
    content_type 'text/html'
    <<-HTML
      <p>Test Oauth with SignNow's Eval server<p>
      <a href="/auth/sign_now">Sign in with SignNow</a>
    HTML
  end

  get '/auth/:provider/callback' do
    MultiJson.encode(request.env)
  end

  get '/auth/failure' do
    MultiJson.encode(request.env)
  end
end

use Rack::Session::Cookie, :secret => 'secret identity'

use OmniAuth::Builder do
  provider :sign_now, ENV['client_id'], ENV['client_secret'], {
      client_options: {
        site: 'https://capi-eval.signnow.com/api/',
        token_url: 'https://capi-eval.signnow.com/api/oauth2/token',
        authorize_url: 'https://eval.signnow.com/proxy/index.php/authorize'
      },
      server_env: 'eval'
  }
end

run OmniauthSignNow.new
