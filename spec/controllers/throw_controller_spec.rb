require 'spec_helper'

describe ThrowController do
  @my_throw = "rock"
  @comp_throw = "paper"
 
  describe "GET random page (rock, paper, or scissors)" do
    it "should be successful" do
      match 'throw/@my_throw' => 'throw#my_throw'
      response.should be_success
    end
  end
end
