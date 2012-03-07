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
	it "should contain game instructions" do
		get :instructions
		response.should contain("The game is played as follows")
		#this one also works:
		#response.should have_selector("h1", :content => "Rock, Paper, Scissors! - Instructions")
	end
  end

  #red
  #currently my best guess. Still doesn't work, though.
  describe "Winners and Losers" do
	it "should win, lose or tie" do
		@defeat = {rock: :scissors, paper: :rock, scissors: :paper}
		@throws = @defeat.keys
		@my_throw = 'paper' #@throws.sample
		@comp_throw = 'paper' #@throws.sample
	
		#get the action, and set the param ':type' with our
		#generated move (rock, paper, or scissors)
		#Also set what the computer will throw so we can
		#see if the response is correct:
		get :my_throw, :type => @my_throw, :computer_throw => @comp_throw
		
		#@comp_throw = assigns(:computer_throw)

    		if @my_throw==@comp_throw
			response.should contain("You tied.")
    		elsif @comp_throw == @defeat[@my_throw] 
			response.should contain("You Won!")
    		else
			response.should contain("You Lost!")
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
