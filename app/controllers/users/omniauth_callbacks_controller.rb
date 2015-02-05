class Users::OmniauthCallbacksController < Devise::OmniauthCallbacksController
  def meetup
    # You need to implement the method below in your model (e.g. app/models/user.rb)
    @user = User.from_omniauth(request.env["omniauth.auth"])

    if @user.persisted?
      sign_in_and_redirect @user, :event => :authentication #this will throw if @user is not activated
      set_flash_message(:notice, :success, :kind => "Meetup") if is_navigational_format?
    else
      session["devise.meetup_data"] = request.env["omniauth.auth"]
      redirect_to map_path
    end

    # if user is successfully logged in on meetup
  end
end
