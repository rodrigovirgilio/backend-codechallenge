module Api
  module V1
    module Authenticable
      extend ActiveSupport::Concern

      included do
        attr_reader :current_user_token

        before_action :authenticate
      end

      protected

      def authenticate
        validate_token || render_unauthorized
      end

      def render_unauthorized
        render json: { errors: "Access denied!" }, status: :unauthorized
      end

      def http_auth_header
        return unless request.headers["Authorization"].present?

        request.headers["Authorization"].split(" ").last
      end

      def validate_token
        @current_user_token ||= Authentication.find_by(token: http_auth_header)
      end
    end
  end
end
