class UserAuthenticator
    class AuthenticationError < StandardError; end

    attr_reader :authenticator
  
    # attr_reader :user, :access_token

    def initialize(code: nil, login: nil, password: nil)
      @authenticator = if code.present?
        Oauth.new(code)
      else
        Standard.new(login, password)
      end
    end

    def perform
      authenticator.perform
    end

    def user
      authenticator.user
    end

    def access_token
      authenticator.access_token
    end
    
    attr_reader :code
end