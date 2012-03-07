require 'spec_helper'

describe ClearController do
 #render_views is NOT automatic. Need to put it here!
  render_views

  #green
  describe "GET clear" do
    it "should be successful" do
      get 'index'
      response.should be_success
    end
  end

  #green
  describe "GET clear page" do
  it "should show clear history message" do
		get :index
		response.should have_selector("h1", :content => "Clear history")
	end
  end

end
