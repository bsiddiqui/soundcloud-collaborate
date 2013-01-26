class SongsController < ApplicationController
  # GET /songs
  # GET /songs.json

  require 'soundcloud'

  def index
    @songs = Song.all

    respond_to do |format|
      format.html
      format.json { render json: @songs }
    end
  end

  # GET /songs/1
  # GET /songs/1.json
  def show
    @song = Song.find_by_name_and_party_profile_id(params[:name], params[:party_profile_id])
    if params[:commit] == "Up"
      @votecount = @song.totalVotes.to_i + 1
      @song.update_attribute(:totalVotes, @votecount)
    end
    if params[:commit] == "Down"
      @votecount = @song.totalVotes.to_i - 1
      @song.update_attribute(:totalVotes, @votecount)
    end

    if params[:commit] == "X"
      @song.destroy
    end
  end

  def search
   client = Soundcloud.new(:client_id => '38442c42728e142332656494cd2f8589')
   if request.xhr?
    @tracks = client.get('/tracks', :q => params[:name], :order => 'hotness', :limit => 10)
    @party_profile_id = params[:party_profile_id]
    render :partial => 'search', :locals => {:name => params[:name]}
  else
    @tracks = client.get('/tracks', :q => params[:name], :order => 'hotness', :limit => 10)
    @party_profile_id = params[:party_profile_id]
    render :partial => 'search'
  end

end


  # GET /songs/new
  # GET /songs/new.json
  def new

   # render :action => 'create'
   if @song=Song.where("soundcloud_id = ? AND party_profile_id = ?", params[:soundcloud_id], params[:party_profile_id]).empty?
     @song = Song.new(:name => params[:name],
      :soundcloud_id => params[:soundcloud_id], 
      :length => params[:length],
      :totalVotes => 0,
      :user_id => current_user.id,
      :party_profile_id => params[:party_profile_id])
     @song.save
   else 
    flash.now[:alert]="This song was already added."
  end
end


  # GET /songs/1/edit
  def edit
  end

  # POST /songs
  # POST /songs.json
  def create
    @party_profile = PartyProfile.includes(:songs).where("id = ?", params[:party_profile_id]).first

    @song = Song.new(:name => params[:name],
      :artist => params[:artist],
      :party_profile_id => params[:party_profile_id],
      :totalVotes => 0)
    #add length
    if @song.save
      respond_to do |format|
        format.js
      end
    else
      redirect_to party_path(@party), :alert => "Could not add song."
    end
  end

  def songplayed
    @song = Song.where("soundcloud_id = ? AND party_profile_id = ?", params[:soundcloud_id], params[:party_profile_id]).first
    @song.update_attributes(:played => true)
    puts "songplayed!!!!!"
  end


  # PUT /songs/1
  # PUT /songs/1.json
  def update
  end

  # DELETE /songs/1
  # DELETE /songs/1.json
  def destroy
  end
end
