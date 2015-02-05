require 'rest_client'

class MapsController < ApplicationController

  def show
  end

  def api_call
    @response = RestClient.get 'https://api.meetup.com/2/member/self/', {:params => {:access_token => "2462d00548212213a467afbd2cf165ae"}}
    @response.code
  end

end
