require 'spec_helper'

describe ThrowController do
  describe "GET random page (rock, paper, or scissors)" do
    it "should be successful" do
		@defeat = {rock: :scissors, paper: :rock, scissors: :paper}
		@throws = @defeat.keys
		@my_throw = @throws.sample
  		@comp_throw = @throws.sample
      match 'throw/@my_throw' => 'throw#my_throw'
      response.should be_success
    end
  end

  describe "Winners and Losers" do
	it "should win, lose or tie" do
		@defeat = {rock: :scissors, paper: :rock, scissors: :paper}
		@throws = @defeat.keys
		@my_throw = @throws.sample
  		@comp_throw = @throws.sample
		match 'throw/@my_throw' => 'throw#my_throw'
		if @my_throw==@comp_throw
			@result.should == "You tied."
    		elsif @comp_throw == @defeat[@my_throw] 
      			@result.should == "You Won!"
    		else
       		@result.should == "You Lost!"
    		end
	end
  end
end
