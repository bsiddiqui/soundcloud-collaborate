class PartyProfilesController < ApplicationController
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
    @party_profile = PartyProfile.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @party_profile }
    end
  end

  # GET /party_profiles/new
  # GET /party_profiles/new.json
  def new
    @party_profile = PartyProfile.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @party_profile }
    end
  end

  # GET /party_profiles/1/edit
  def edit
    @party_profile = PartyProfile.find(params[:id])
  end

  # POST /party_profiles
  # POST /party_profiles.json
  def create
    @party_profile = PartyProfile.new(params[:party_profile])

    respond_to do |format|
      if @party_profile.save
        format.html { redirect_to @party_profile, notice: 'Party profile was successfully created.' }
        format.json { render json: @party_profile, status: :created, location: @party_profile }
      else
        format.html { render action: "new" }
        format.json { render json: @party_profile.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /party_profiles/1
  # PUT /party_profiles/1.json
  def update
    @party_profile = PartyProfile.find(params[:id])

    respond_to do |format|
      if @party_profile.update_attributes(params[:party_profile])
        format.html { redirect_to @party_profile, notice: 'Party profile was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @party_profile.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /party_profiles/1
  # DELETE /party_profiles/1.json
  def destroy
    @party_profile = PartyProfile.find(params[:id])
    @party_profile.destroy

    respond_to do |format|
      format.html { redirect_to party_profiles_url }
      format.json { head :no_content }
    end
  end
end
