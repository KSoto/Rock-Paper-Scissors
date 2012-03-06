class ThrowController < ApplicationController
before_filter do
  @defeat = {rock: :scissors, paper: :rock, scissors: :paper}
  @throws = @defeat.keys
  @computer_throw = @throws.sample
end

def my_throw
    @player_throw = params[:type].to_sym
if !@throws.include?(@player_throw)
	@result = "invalid"
else
    #session[:history] must first be declared as a new array,
    #which is done in application_controller.rb
    #append the player's throw and the comp's throw to be
    #printed out in stats later
    session[:history] << @player_throw
    session[:history] << @computer_throw
    
    session[:counter] += 1

    if @player_throw == @computer_throw
      session[:history] << "Tie"
      @result = "You tied."
    elsif @computer_throw == @defeat[@player_throw]
      session[:history] << "Win"  
      @result = "You Won!"
    else
      session[:history] << "Lose"
      @result = "You Lost!"
    end
end #end if/else
end #end def

def instructions
	#all information will be displayed in the view, instructions.html.erb
end

end
