class SessionsController < ApplicationController
  def create
    puts "in session controller create /n"
    @user = User.find_or_create_from_auth_hash(auth_hash)
    self.current_user = @user
    puts @user
    puts "/n" * 5
    puts "*" * 30
    puts User.all
    redirect_to '/'
  end

  protected

  def auth_hash
    request.env['omniauth.auth']
  end
end
