class ThrowController < ApplicationController
before_filter do
  @defeat = {rock: :scissors, paper: :rock, scissors: :paper}
  @throws = @defeat.keys
  @computer_throw = @throws.sample
end

def my_throw
    @player_throw = params[:type].to_sym
    if !@throws.include?(@player_throw)
        #halt 403, "You must throw one of the following: #{@throws}"
    end
    #session[:history].push(@player_throw)
    #session[:history].push(@computer_throw)
    
    #if @player_throw == @computer_throw
      #session[:counter] += 1
      #session[:history].push("tie")
      #erb :tie
    #elsif @computer_throw == @defeat[@player_throw]
      #session[:counter] += 1
      #session[:history].push("win")  
      #erb :win
    #else
      #session[:counter] += 1 
      #session[:history].push("lose")
      #erb :lose
    #end
end

end
