class PartyProfilesController < ApplicationController
require 'soundcloud'
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
    @party_profile = PartyProfile.where("id = ?", params[:id]).first
    @songs = Song.where("played = ? AND party_profile_id = ?", false, @party_profile.id).all
    @playlist = @songs.sort! { |a,b| b[:totalVotes] <=> a[:totalVotes]}
    
    unless @playlist.empty?
      @firstsong=@playlist.first.soundcloud_id
      @playlist.first.update_attributes(:played => true)
    #puts @playlist.first
    #puts "FIND ME"
  end
end



#    unless @playlist.empty?
 #     respond_to do |format|
  #      format.html 
#      format.json { render json: @party_profile }
 #   end
  #end
  #end

  # GET /party_profiles/new
  # GET /party_profiles/new.json
  def new
    @party_profile = PartyProfile.new 
  end


  def search
    @party_profile = PartyProfile.new
  end


  def display
    @party_profile = PartyProfile.find_all_by_name(params[:name])
    if request.xhr?
      render :partial => 'searchresults', :locals => {:party_profile => @party_profile, :name => params[:name]}
    else
      if @party_profile.empty?
        redirect_to "/parties/search"
        flash[:alert] = "This party does not seem to exist. Try again."
      else
        render :partial => 'searchresults', :locals => {:party_profile => @party_profile, :name => params[:name]}
      end
    end
  end


  # POST /party_profiles
  # POST /party_profiles.json
  def create
    party_profile = PartyProfile.new(params[:party_profile]) 
    party_profile.host = current_user
    if party_profile.save!
      redirect_to party_profile_path(party_profile)

    else 
     redirect_to new_party_profile_path
     flash[:alert] = "Please fill out all of the fields."
   end
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
