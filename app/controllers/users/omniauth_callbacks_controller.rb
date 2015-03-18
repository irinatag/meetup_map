class Users::OmniauthCallbacksController < Devise::OmniauthCallbacksController
  def meetup
    # You need to implement the method below in your model (e.g. app/models/user.rb)
    puts "entering omnioath controller!\n"

    @user = User.from_omniauth(request.env["omniauth.auth"])

    if @user.persisted? #remember me on their side?
      puts "*" * 50
      puts "i am here now"
      sign_in_and_redirect @user, :event => :authentication #this will throw if @user is not activated
      set_flash_message(:notice, :success, :kind => "Meetup") if is_navigational_format?
    else
      puts "*" * 50
      puts "not there!"
      puts session["devise.meetup_data"] = request.env["omniauth.auth"]
      puts session["devise.meetup_data"]
      puts "*" * 50
      redirect_to map_path
    end

    # if user is successfully logged in on meetup
  end
end
