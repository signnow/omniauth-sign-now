This is the official Omniauth strategy to authorize your client with SignNow as a provider.

To obtain the `client_id` and `client_secret` please contact <api@signnow.com> 

There is a sample Sinatra app located at `examples/config.ru`. To run the example you will need a Rack webserver installed as well as the `client_id` and `client_secret`. When you are able to start the server go to <http://localhost:9292> and continue through the Oauth2 flow.

## Build & Installation

If you want to build the gem follow these steps. Otherwise skip to Usage.

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
    
By default the gem makes requests to the production server. While developing you can configure the gem to hit our Eval server as the sample app does in `examples/config.ru`.

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

