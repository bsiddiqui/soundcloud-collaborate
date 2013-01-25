class ApiPartiesController < ApplicationController
  # GET /api_parties
  # GET /api_parties.json
  # shows all parties as JSON
  def index
  		begin
  			@parties = PartyProfile.all
  		rescue Exception => e
  			render :text => "unknown article", :status => 404
  		else
  			render json: @parties
  		end
  end

  # GET /api_parties/1
  # GET /api_parties/1.json
  def show
  end

  # GET /api_parties/new
  # GET /api_parties/new.json
  def new
  end

  # GET /api_parties/1/edit
  def edit
  end

  # POST /api_parties
  # POST /api_parties.json
  def create
  end

  # PUT /api_parties/1
  # PUT /api_parties/1.json
  def update
  end

  # DELETE /api_parties/1
  # DELETE /api_parties/1.json
  def destroy
  end
end
