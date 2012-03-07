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

  #green
  describe "Winners and Losers" do
	it "should win, lose or tie" do
		@defeat = {rock: :scissors, paper: :rock, scissors: :paper}
		@throws = @defeat.keys
		
		#generate a random move:
		@my_throw = @throws.sample
	
		#get the action, and set the param ':type' with our
		#generated move (rock, paper, or scissors)
		get :my_throw, :type => @my_throw
		
		#get what the computer threw from the controller
		#so we can see what the correct outcome should be
		@comp_throw = assigns(:computer_throw)
		
		print "Tested Moves: \nPlayer's Move - ", @my_throw, "\nComputer's Move - ", @comp_throw

    		if (@my_throw==@comp_throw)
				print "\nOutcome - tie"
				response.should contain("You tied.")
    		elsif (@comp_throw == @defeat[@my_throw]) 
				print "\nOutcome - win"
				response.should contain("You Won!")
    		elsif (@mythrow == @defeat[@comp_throw])
				print "\nOutcome - lost"
				response.should contain("You Lost!")
    		end

	end
  end
end