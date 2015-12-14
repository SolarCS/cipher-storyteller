module Api
  class SessionsController < BaseController

    skip_before_action :authenticate!, only: [:create]

    def create
      if user && user.authenticate(password)
        render json: user, serializer: CurrentUserSerializer, root: false
      else
        render_unauthenticated!
      end
    end

    def destroy
      current_user.destroy_token!
      render nothing: true
    end

    def verify
      render json: current_user, serializer: CurrentUserSerializer, root: false
    end

  protected

    def user
      @user ||= User.find_by email: params[:email]
    end

    def password
      params[:password]
    end

  end
end
