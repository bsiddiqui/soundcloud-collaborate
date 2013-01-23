class PartyProfilesController < ApplicationController

  before_filter :authenticate_user!, :except => :index
  # GET /party_profiles
  # GET /party_profiles.json
  def index
    @party_profiles = PartyProfile.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @party_profiles }
    end
  end

  # GET /party_profiles/1
  # GET /party_profiles/1.json
  def show
    @song = Song.new
    @party_profile = PartyProfile.includes(:songs).where("id = ?", params[:id]).first
    @songs = (@party_profile.songs.where("played = ?", "false")).sort! { |a,b| b[:totalVotes] <=> a[:totalVotes]}
    #@party_tracks = @party.party_tracks
  end

  # GET /party_profiles/new
  # GET /party_profiles/new.json
  def new
    @party_profile = PartyProfile.new 
 #   render :partial => 'form', :locals => {:party_profile => @party_profile}
  end


def search
  @party_profile = PartyProfile.new
end


    #.sort_by(&:name.downcase)
  #  if @party != nil
      #AJAX redirect_to party_path(@party)
   # else
    #  redirect_to (:back), :alert => "Nobody seems to be throwing that party! Try again."
   # end

   def display
    @party_profile = PartyProfile.find_all_by_name(params[:name])
    if @party_profile.empty?
      redirect_to "/parties/search"
      flash[:alert] = "This party does not seem to exist. Try again."
    else
      render :partial => 'searchresults', :locals => {:party_profile => @party_profile, :name => params[:name]}
    end
  end


  # POST /party_profiles
  # POST /party_profiles.json
  def create
    party_profile = PartyProfile.new(params[:party_profile]) 
    party_profile.host = current_user

  #    respond_to do |format|
  if party_profile.save!
    redirect_to party_profile_path(party_profile)
 #        format.html {redirect_to party_profile_path(@party_profile), :notice => "Your party has been created."}

else 
#          format.html {render partial: 'form', flash[:notice] => "fail"}
          #format.json {render json: @party_profile.errors, status: :unprocessable_entity }
         # format.js { render action: 'reload' }
         redirect_to new_party_profile_path
         flash[:alert] = "Please fill out all of the fields."
       end
  #   end

end



  # PUT /party_profiles/1
  # PUT /party_profiles/1.json
  def update
  end

  # DELETE /party_profiles/1
  # DELETE /party_profiles/1.json
  def destroy
  end

end
