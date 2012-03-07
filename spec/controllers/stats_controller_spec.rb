require 'spec_helper'

describe StatsController do

  describe "GET stats" do
    it "should be successful" do
      get 'index'
      response.should be_success
    end
  end

end
