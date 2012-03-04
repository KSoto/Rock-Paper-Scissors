class ApplicationController < ActionController::Base
  protect_from_forgery
  @defeat = {rock: :scissors, paper: :rock, scissors: :paper}
  @throws = @defeat.keys
  @computer_throw = @throws.sample

end
