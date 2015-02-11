require 'rest_client'

class MapsController < ApplicationController

  def show
    pp session["devise.meetup_data"]
    uid = session["devise.meetup_data"]["uid"]
    response = RestClient.get "https://api.meetup.com/2/events?status=upcoming&order=time&limited_events=False&desc=false&member_id=10653533&offset=0&photo-host=public&format=json&page=20&fields=&sig_id=#{uid}&sig=594ee8c4bb58d735c6ab32c828210391680658e5"
    pp response

    #setting gon variable for js
    gon.meetup_events = response
  end

end
