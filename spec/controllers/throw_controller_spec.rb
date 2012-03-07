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

  #currently by best guess. Still doesn't work, though.
  describe "Winners and Losers" do
	it "should win, lose or tie" do
		@defeat = {rock: :scissors, paper: :rock, scissors: :paper}
		@throws = @defeat.keys
		@my_throw = @throws.sample
  		@comp_throw = @throws.sample

		get "throw/#{@my_throw}"

		result = assigns[:result]
    		if @my_throw==@comp_throw
			result.should == "You tied."
    		elsif @comp_throw == defeat[@my_throw] 
     		 	result.should == "You Won!"
    		else
       		result.should == "You Lost!"
    		end

	end
  end
end

#Also tried this:
#	  	throw_controller = ThrowController.new
#		throws = throw_controller.assigns[:throws]
#		user_throw = throws.sample
#		comp_throw = throws.sample
#		defeat = throw_controller.assigns[:defeat]
#		match 'throw/user_throw' => 'throw#my_throw'
#		result = throw_controller.my_throw.assigns[:result]
#    		if user_throw==comp_throw
#			result.should == "You tied."
#    		elsif comp_throw == defeat[user_throw] 
#     		 	result.should == "You Won!"
#    		else
#       		result.should == "You Lost!"
#    		end
