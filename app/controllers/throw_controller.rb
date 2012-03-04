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
end

end
