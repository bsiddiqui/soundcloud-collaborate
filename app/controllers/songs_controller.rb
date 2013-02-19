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
    

    #@songs = Song.where("played = ? AND party_profile_id = ?", false, @party_profile.id).all

  # GET /songs/1
  # GET /songs/1.json
  def show
    @song = Song.find_by_name_and_party_profile_id(params[:name], params[:party_profile_id])

    #if User hasn't voted on a song at party, add a record of them voting 
    if UserVote.where("user_id = ? AND party_profile_id = ? AND soundcloud_id =?", current_user.id, @song.party_profile_id, @song.soundcloud_id).empty?
      uservote = UserVote.new(:user_id => current_user.id, :party_profile_id => @song.party_profile_id, :soundcloud_id => @song.soundcloud_id)
      uservote.save
    end

    # create a var to access uservotes
    uservotes = UserVote.where("user_id = ? AND party_profile_id = ? AND soundcloud_id =?", current_user.id, @song.party_profile_id, @song.soundcloud_id).first

    #if user has not voted or has downvoted, allow upvote
    if (params[:commit] == "Up")
      if uservotes.totalVotes <= 0
        @votecount = @song.totalVotes.to_i + 1
        @song.update_attribute(:totalVotes, @votecount)
        uservotes.update_attribute(:totalVotes, uservotes.totalVotes + 1)
        puts "can upvote"
      else
        #insert flash error
        puts "can't upvote"
      end
    end
    
    #if user has not voted or has upvoted, allow downvote
    if (params[:commit] == "Down") 
      if uservotes.totalVotes >= 0
        @votecount = @song.totalVotes.to_i - 1
        @song.update_attribute(:totalVotes, @votecount)
        uservotes.update_attribute(:totalVotes, uservotes.totalVotes - 1)
      else
        #insert flash error
        puts "can't downvote"
      end
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
