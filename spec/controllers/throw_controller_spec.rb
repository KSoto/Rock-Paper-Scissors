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
	  throw = ThrowController.new
		#@my_throw = throw.@throws.sample
  	@comp_throw = throw(:throws).sample
		@my_throw = 'rock'
    match 'throw/@my_throw' => 'throw#my_throw'
		response.should be_success
    #if @my_throw==@comp_throw
		#	throw.@result.should == "You tied."
    #		elsif @comp_throw == @defeat[@my_throw] 
     # 			throw.@result.should == "You Won!"
    	#	else
       #		throw.@result.should == "You Lost!"
    		#end
	end
  end
end
