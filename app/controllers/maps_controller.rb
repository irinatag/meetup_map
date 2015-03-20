require 'rest_client'

class MapsController < ApplicationController

  def show
    uid = session["devise.meetup_data"]["uid"]
    response = RestClient.get "https://api.meetup.com/2/events?member_id=#{uid}&offset=0&format=json&limited_events=False&photo-host=public&page=20&fields=&order=time&desc=false&status=upcoming"

    #setting gon variable for js
    gon.meetup_events = response
  end

end
