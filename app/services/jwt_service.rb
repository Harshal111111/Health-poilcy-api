class JwtService
    class << self
      def encode(payload, expiration = 24.hours.from_now)
        payload[:exp] = expiration.to_i
        JWT.encode(payload, Rails.application.secrets.secret_key_base)
      end
  
      def decode(token)
        decoded = JWT.decode(token, Rails.application.secrets.secret_key_base)[0]
        HashWithIndifferentAccess.new decoded
      rescue JWT::DecodeError
        nil
      end
    end
  end