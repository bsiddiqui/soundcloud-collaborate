class UsersController < ApplicationController

  def new
    authenticate_user! 
  end


  def edit
  end

  # queries database for parties associated with user to display on their homepage
  def show
  @parties1 = PartyProfile.new
  @parties1 = PartyProfile.find_all_by_host(current_user.id)

 # @guest = Guest.find_all_by_user_id(current_user.id)
  #  unless @guest.empty?
 #     params[:guest].each do |i|
   #     @parties2 = PartyProfile.find_all_by_id(guest.party_profile_id) 
   #   @parties_guest = PartyProfiles.find_all_by_id(@guest.party_profile_id)
    #  end
   # end 
  end

  def index
    @user = current_user
  end

  # logs out the user
  def destroy
    destroy_session
    redirect_to parties_path, :alert => "Signed Out" 
  end
  
  def update
  end
end