class LocationsController < ApplicationController
  def index
    if params[:address]
      @locations = Location.search do
        fulltext params[:address]
        paginate page: params[:page]
      end.results
    elsif params[:latlng] && params[:radius]
      lat, lng = params[:latlng].split(',')
      @locations = Location.search do
        with(:location).in_radius(lat, lng, params[:radius])
        order_by_geodist(:location, lat,lng)
        paginate page: params[:page]
      end.results
    else
      @locations = []
    end
  end
end
