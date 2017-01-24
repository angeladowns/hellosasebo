class PagesController < ApplicationController
  def info
  end

  def map
  if params[:search].present?
    @adventures = Adventure.near(params[:search], 1000, :order => :address)
  else
    @adventures = Adventure.all
  end
  @hash = Gmaps4rails.build_markers(@adventures) do |adventure, marker|
    marker.lat adventure.latitude
    marker.lng adventure.longitude
    marker.infowindow adventure.name
    marker.picture({
      "width" => 32,
      "height" => 32})
    marker.json({ name: adventure.name})
  end
end

end
