require 'rest_client'

class MapsController < ApplicationController

  def show
    puts session["devise.meetup_data"]
    token = session["devise.meetup_data"]["credentials"]["token"]
    uid = session["devise.meetup_data"]["uid"]
    # @response = RestClient.get 'https://api.meetup.com/2/member/self/', {:params => {:access_token => token}}
    @response = RestClient.get "https://api.meetup.com/2/events?status=upcoming&order=time&limited_events=False&desc=false&member_id=10653533&offset=0&photo-host=public&format=json&page=20&fields=&sig_id=#{uid}&sig=594ee8c4bb58d735c6ab32c828210391680658e5"
    puts @response
  end

  def api_call
  end

end
