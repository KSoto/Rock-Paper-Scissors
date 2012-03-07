require 'spec_helper'

describe ThrowController do
 #render_views is NOT automatic. Need to put it here!
  render_views
 
  #green 
  describe "GET random page (rock, paper, or scissors)" do
    it "should be successful" do
		@defeat = {rock: :scissors, paper: :rock, scissors: :paper}
		@throws = @defeat.keys
		@my_throw = @throws.sample
  		@comp_throw = @throws.sample
      match '/throw/@my_throw' => 'throw#my_throw'
      response.should be_success
    end
  end

  #green
  describe "GET instructions" do
	it "should be successful" do
		match 'throw'
    		#render isn't working for me...
		#render
		#rendered.should =~ "The game is played as follows"
		#response.should contain("The game is played as follows")
		response.should be_success
	end
  end

  #red
  #currently my best guess. Still doesn't work, though.
  describe "Winners and Losers" do
	it "should win, lose or tie" do
		@defeat = {rock: :scissors, paper: :rock, scissors: :paper}
		@throws = @defeat.keys
		@my_throw = @throws.sample
  		@comp_throw = @throws.sample

		#get? match? visit?
		match "/throw/#{@my_throw}"
		
		#result is ending up nil...
    		if @my_throw==@comp_throw
			assigns(:result).should == "You tied."
    		elsif @comp_throw == @defeat[@my_throw] 
     		 	assigns(:result).should == "You Won!"
    		else
       		assigns(:result).should == "You Lost!"
    		end

	end
  end
end

#Current Error:
#     ActionController::RoutingError:
#       No route matches {:controller=>"throw", :action=>"throw/rock"}


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
