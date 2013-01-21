class SongsController < ApplicationController
  # GET /songs
  # GET /songs.json
  def index
    @songs = Song.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @songs }
    end
  end

  # GET /songs/1
  # GET /songs/1.json
  def show
    @song = Song.find_by_name_and_party_profile_id(params[:song][:name], params[:song][:party_profile_id])
    if params[:commit] == "Up"
      @votecount = @song.totalVotes.to_i + 1
      @song.update_attribute(:totalVotes, @votecount)
      redirect_to(:back)
    end
    if params[:commit] == "Down"
      @votecount = @song.totalVotes.to_i - 1
      @song.update_attribute(:totalVotes, @votecount)
      redirect_to(:back)
    end
  end

  # GET /songs/new
  # GET /songs/new.json
  def new
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

  # PUT /songs/1
  # PUT /songs/1.json
  def update
  end

  # DELETE /songs/1
  # DELETE /songs/1.json
  def destroy
    @song = Song.find_by_party_id_and_name(params[:party_id], params[:name])
    unless post.empty?
      @song.destroy
    end
    redirect_to(:back)
  end
end
