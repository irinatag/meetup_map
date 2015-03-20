require 'rest_client'

class MapsController < ApplicationController

  def show
    puts "session hash:" + session["devise.meetup_data"].to_s
    uid = session["devise.meetup_data"]["uid"]
    # sig = session["devise.meetup_data"]["sig"]
    time1 = Time.now.to_i
    time2 = (Time.now + (7*24*60*60)).to_i
    response = RestClient.get "https://api.meetup.com/2/events?member_id=#{uid}&offset=0&format=json&limited_events=False&photo-host=public&time=#{time1}+000%2C+#{time2}+000&page=500&fields=&order=time&desc=false&status=upcoming&sig_id=#{uid}&sig=65b4439deb15ab636a29d2694f3028a7657899de"

    #setting gon variable for js
    gon.meetup_events = response
  end

end
