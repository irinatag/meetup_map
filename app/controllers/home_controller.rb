class HomeController < ApplicationController

  def login
    puts session["devise.meetup_data"]
  end

  def show
    @data = File.read("public/assets/javascripts/events.json");
    render json: @data
  end

end
