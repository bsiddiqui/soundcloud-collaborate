class SessionsController < ApplicationController
  def new
  end

  # creates a new account for first time users
  # authenticates and logs in the user through omni-auth/facebook
  # if the user's information saves to the database, it redirects 
  #the user to their home page, else it displays an error message
  def create
    $auth_hash = request.env['omniauth.auth']
    name = $auth_hash["info"]["name"]
    first_name = $auth_hash["info"]["first_name"]
    last_name = $auth_hash["info"]["last_name"]
    email = $auth_hash["info"]["email"]
    image = $auth_hash["info"]["image"].gsub("=square","=large")
    uid = $auth_hash["uid"] 
    user = User.new(:name => name, :first_name => first_name, :last_name => last_name, :email => email, :image => image, :uid => uid)
    if user.save
      session[:user_id] = user.id
      redirect_to user_path(current_user), :alert => "Thanks for signing up!"
    else
      session[:user_id] = User.find_by_uid(uid).id
      redirect_to user_path(current_user), :alert => "Welcome Back"
    end
  end

  def failure
  end

  # calls the destroy_session method when the user logs out
  def destroy
    destroy_session
    redirect_to "/static_pages/new", :alert => "Signed Out" 
  end
end
