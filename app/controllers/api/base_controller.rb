module Api
  class BaseController < ApplicationController

    layout false

    before_action :set_default_response_format
    before_action :authenticate!

    def current_user
      @current_user ||= User.find_by(auth_token: auth_token) if auth_token.present?
    end

  protected

    def auth_token
      @auth_token ||= request.headers['HTTP_AUTH_TOKEN']
    end

    def authenticate!
      current_user || render_unauthenticated!
    end

    def render_unauthenticated!
      render json: { error: 'Authentication failed' }, status: 401
      false
    end

    def render_unauthorized!
      render json: { error: 'Unauthorized' }, status: 403
      false
    end

    def set_default_response_format
        request.format = :json
    end

  end
end
