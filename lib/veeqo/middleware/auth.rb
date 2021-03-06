module Veeqo
  module Middleware
    class Auth < Faraday::Middleware
      def initialize(app, options = {})
        @app = app
        @options = options
      end

      def call(env)
        env[:request_headers]['x-api-key'] = @options[:api_key]
        @app.call env
      end
    end
  end
end
