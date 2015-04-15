require 'rest_client'

class MapsController < ApplicationController

  def show
  meetup_events = RestClient.get "https://api.meetup.com/2/events?access_token=#{access_token}&member_id=#{uid}&offset=0&format=json&limited_events=False&photo-host=public&page=500&fields=&order=time&desc=false&status=upcoming"

  #set gon variable for js
  gon.meetup_events = meetup_events
  end

  private

  def uid
    return unless session['devise.meetup_data']

    session['devise.meetup_data']['uid']
  end

  def access_token
    return unless session['devise.meetup_data']

    session['devise.meetup_data']['credentials']['token']
  end
end
