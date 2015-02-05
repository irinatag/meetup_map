class HomeController < ApplicationController

  def login
  end

  def show
    @data = File.read("public/assets/javascripts/events.json");
    render json: @data
  end

end
