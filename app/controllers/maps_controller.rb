require 'rest_client'

class MapsController < ApplicationController

  def show
    puts session["devise.meetup_data"]
    @token = session["devise.meetup_data"]["credentials"]["token"]
    @response = RestClient.get 'https://api.meetup.com/2/member/self/', {:params => {:access_token => @token}}
    puts @response
  end

  def api_call
  end

end
