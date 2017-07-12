require 'rt_oauth_client/engine'
require 'rt_oauth_client/version'
require 'rt_oauth_client/cookie_auth'
require 'rt_oauth_client/param_token'
require 'rt_oauth_client/authorizer'
require 'rt_oauth_client/protector'
module RtOauthClient
  autoload :Authorizer, 'rt_oauth_client/authorizer'
  autoload :CookieAuth, 'rt_oauth_client/cookie_auth'
  autoload :ParamToken, 'rt_oauth_client/param_token'
  autoload :Protector, 'rt_oauth_client/protector'

  class << self
    attr_accessor :configuration
  end

  def self.configure
    self.configuration ||= Configuration.new
    yield(configuration)
  end

  class Configuration
    attr_accessor :authentication_methods, :cookie_name, :token_name,
                  :oauth_token_name, :client_id, :client_secret, :bearer_token_regex,
                  :oauth_url

    def initialize
      @authentication_methods = [:cookie_auth, :param_token, :bearer_token]
      @cookie_name            = 'access_token'
      @token_name             = 'access_token'
      @oauth_token_name       = 'access_token'
      @client_id              = 'a0f788c8f081c343a889af3d6473652895e871f34a8ac17a29dd036b7b2919af'
      @client_secret          = ''
      @bearer_token_regex     = /Bearer /i
      @oauth_url              = 'http://localhost:3200/api/v1/me.json'
    end
  end
end
