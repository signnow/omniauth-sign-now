# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'omniauth/sign_now/version'

Gem::Specification.new do |gem|
  gem.name          = "omniauth-sign-now"
  gem.version       = OmniAuth::SignNow::VERSION
  gem.authors       = ["Loc Nguyen"]
  gem.email         = ["lhnguyen@barracuda.com"]
  gem.summary       = "SignNow strategy for Omniauth with OAuth 2.0"
  gem.description   = "SignNow strategy for Omniauth"
  gem.homepage      = ""

  gem.files         = `git ls-files`.split($/)
  gem.executables   = gem.files.grep(%r{^bin/}) { |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.require_paths = ["lib"]

  gem.add_development_dependency 'rspec', '~>2.14.1'
  gem.add_runtime_dependency 'omniauth-oauth2', '~> 1.1.2'
end
