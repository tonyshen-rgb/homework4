class PlacesController < ApplicationController
  def index
    @places = Place.all
  end

  def show
    @place = Place.find_by({ "id" => params["id"] })

    if current_user
      @entries = Entry.where({
        "place_id" => @place["id"],
        "user_id" => current_user["id"]
      }).order({ "occurred_on" => :desc, "id" => :desc })
    else
      @entries = []
    end
  end

  def new
  end

  def create
    @place = Place.new
    @place["name"] = params["name"]

    if @place.save
      redirect_to "/places"
    else
      flash["notice"] = @place.errors.full_messages.join(", ")
      redirect_to "/places/new"
    end
  end
end