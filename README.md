This is the official Omniauth strategy to authorize your client with SignNow as the Oauth 2 provider.

To obtain the `client_id` and `client_secret` please contact <api@signnow.com> 

## Build & Installation

If you want to build the gem yourself follow these steps. Otherwise you can skip to Usage.

````
  $ bundle

  $ rake build

  $ gem install pkg/omniauth-sign-now-1.0.0.gem
````

## Usage 

Add this line to your application's Gemfile:

    gem 'omniauth-sign-now'

And then execute:

    $ bundle
### Sinatra
````ruby
use OmniAuth::Builder do
  provider :sign_now, ENV['client_id'], ENV['client_secret']
end
````

### Rails
````ruby
Rails.application.config.middleware.use OmniAuth::Builder do
  provider :sign_now, ENV['client_id'], ENV['client_secret']
end
````

## Developers
There is a sample Sinatra app located at `examples/config.ru`. To run the example you will need a Rack webserver installed as well as the `client_id` and `client_secret`. When you are able to run the web server go to <http://localhost:9292> follow the link to go through the Oauth2 flow.

