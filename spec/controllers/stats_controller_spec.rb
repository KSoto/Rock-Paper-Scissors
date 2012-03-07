require 'spec_helper'

describe StatsController do
 #render_views is NOT automatic. Need to put it here!
  render_views

  #green
  describe "GET stats" do
    it "should be successful" do
      get 'index'
      response.should be_success
    end
  end

  #green
  describe "GET stats page" do
    it "should show stats message" do
      get :index
      response.should have_selector("h1", :content => "Rock, Paper, Scissors - Stats")
    end
  end

end
