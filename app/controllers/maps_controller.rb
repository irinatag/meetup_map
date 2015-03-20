require 'rest_client'

class MapsController < ApplicationController

  def show
    puts "session hash:" + session["devise.meetup_data"].to_s
    uid = session["devise.meetup_data"]["uid"]
    # sig = session["devise.meetup_data"]["sig"]
    time1 = Time.now.to_i
    puts time1
    time2 = (Time.now + (7*24*60*60)).to_i
    puts time2
    # https://api.meetup.com/2/events?member_id=10653533&offset=0&format=json&limited_events=False&photo-host=public&time=1426873976000%2C+1427478308000&page=500&fields=&order=time&desc=false&status=upcoming&sig_id=10653533&sig=65b4439deb15ab636a29d2694f3028a7657899de
    puts "*" * 100
    puts uid
    puts "*" * 100
    # response = RestClient.get "https://api.meetup.com/2/events?member_id=#{uid}&offset=0&format=json&limited_events=False&photo-host=public&page=20&fields=&order=time&desc=false&status=upcoming&sig_id=#{uid}&sig=594ee8c4bb58d735c6ab32c828210391680658e5"
    response = RestClient.get "https://api.meetup.com/2/events?&sign=true&photo-host=public&member_id=#{uid}&time=1426873976000, 1427478308000"
    puts "*" * 50
    puts response

    #setting gon variable for js
    gon.meetup_events = response
  end

end
