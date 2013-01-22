class UsersController < ApplicationController

  def new
    authenticate_user! 
  end


  def edit
  end

  # queries database for parties associated with user to display on their homepage
  def show

    @parties_hosted = PartyProfile.new
    @parties_hosted = PartyProfile.find_all_by_host(current_user.id)
    if @parties_hosted.empty?
      flash.now[:alert] = "You have not thrown any parties. Start a party?"
    end

    @parties_guest 
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
    redirect_to "/login", :alert => "Signed Out" 
  end
  
  def update
  end
end