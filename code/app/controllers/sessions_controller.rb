class SessionsController < ApplicationController
  
  def new
  end

  def create
    if user = authenticate_with_google
      if user.save
        cookies.signed[:user_id] = user.id
        redirect_to root_path, alert: 'Welcome'
      end
    else
      redirect_to root_path, alert: 'authentication_failed'
    end

  end

  def destroy
    cookies.signed[:user_id] = nil
    redirect_to root_path
  end

  private
    def authenticate_with_google
      if id_token = flash[:google_sign_in_token]
        user = User.find_or_create_by(uid:  GoogleSignIn::Identity.new(id_token).user_id)
        user.email = GoogleSignIn::Identity.new(id_token).email_address
        user.name = GoogleSignIn::Identity.new(id_token).name
        user
      elsif error = flash[:google_sign_in][:error]
        logger.error "Google authentication error: #{error}"
        nil
      end
    end
end
