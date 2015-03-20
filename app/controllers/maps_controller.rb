require 'rest_client'

class MapsController < ApplicationController

  def show
    puts "session hash:" + session["devise.meetup_data"].to_s
    uid = session["devise.meetup_data"]["uid"]
    sig = session["devise.meetup_data"]["sig"]
    puts "*" * 100
    puts uid
    puts "*" * 100
    puts "*" * 100
    puts sig
    puts "*" * 100
    response = RestClient.get "https://api.meetup.com/2/events?member_id=#{uid}&offset=0&format=json&limited_events=False&photo-host=public&page=20&fields=&order=time&desc=false&status=upcoming&sig_id=#{uid}&sig=594ee8c4bb58d735c6ab32c828210391680658e5"
    puts "*" * 50
    puts response

    #setting gon variable for js
    gon.meetup_events = response
  end

end
