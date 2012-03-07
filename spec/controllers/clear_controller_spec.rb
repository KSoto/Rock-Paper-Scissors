require 'spec_helper'

describe ClearController do

  describe "GET clear" do
    it "should be successful" do
      get 'index'
      response.should be_success
    end
  end

end
