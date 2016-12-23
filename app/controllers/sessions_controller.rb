class SessionsController < ApplicationController
  def create
  #  render text: request.env['omniauth.auth'].to_yaml and return
  #  raise request.env['omniauth.auth'].to_yaml
    begin
     # raise request.env['omniauth.auth'].to_yaml
      @user = User.from_omniauth(request.env['omniauth.auth'])
      puts @user
      session[:user_id] = @user.id
      flash[:success] = "Welcome, #{@user.name}!"
    rescue
     flash[:warning] = "There was an error while trying to authenticate you..."
    end
    redirect_to root_path
  end

  def destroy
    if current_user
      session.delete(:user_id)
      flash[:success] = 'logged out!'
    end
    redirect_to root_path
  end

  def auth_failure
    redirect_to root_path
  end
end
