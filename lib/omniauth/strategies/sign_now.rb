require 'omniauth-oauth2'
require 'base64'

module OmniAuth
  module Strategies
    class SignNow < OmniAuth::Strategies::OAuth2

      option :name, 'sign_now'

      option :client_options, {
          site: 'https://api.signnow.com/',
          token_url: 'https://api.signnow.com/oauth2/token/',
          authorize_url: 'https://signnow.com/proxy/index.php/authorize/'
      }

      option :authorize_params, {
          response_type: 'code'
      }

      option :provider_ignores_state, true

      uid do
        raw_info['id']
      end

      extra do
        raw_info
      end

      def request_phase
        redirect "#{client.auth_code.authorize_url(authorize_params)}&redirect_uri=#{URI.encode(callback_url)}"
      end

      def build_access_token
        token_params = {
            redirect_uri: callback_url,
            client_id: client.id,
            client_secret: client.secret,
            code: request.params['code'],
            headers: {Authorization: 'Basic ' + Base64.strict_encode64("#{client.id}:#{client.secret}")}
        }

        client.auth_code.get_token(request.params['code'], token_params)
      end

      def raw_info
        user_path = options.server_env == 'production' ? '/user' : '/api/user'
        @raw_info ||= access_token.get(user_path).parsed
      end
    end
  end
end