require 'spec_helper'
require 'omniauth-sign-now'

describe OmniAuth::Strategies::SignNow do

  let(:request) { double('Request', params: {}, cookies: {}, env: {}) }
  let(:app) {
    lambda do
      [200, {}, ['Hello world.']]
    end
  }

  subject do
    OmniAuth::Strategies::SignNow.new(app, 'client_id', 'client_secret', @options || {}).tap do |strategy|
      strategy.stub(:request) {
        request
      }
    end
  end

  before do
    OmniAuth.config.test_mode = true
  end

  after do
    OmniAuth.config.test_mode = false
  end

  describe '#client_options' do
    it 'has the correct site' do
      expect(subject.client.site).to eq('https://api.signnow.com/')
    end

    it 'has the correct authorize_url' do
      expect(subject.client.authorize_url).to eq 'https://signnow.com/proxy/index.php/authorize/'
    end

    it 'has the correct token_url' do
      expect(subject.client.token_url).to eq 'https://api.signnow.com/oauth2/token/'
    end
  end

  describe '#options' do
    it 'should set provider_ignore_state to false' do
      expect(subject.options.provider_ignore_state).to be_false
    end
  end
end