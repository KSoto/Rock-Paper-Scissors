class ApplicationController < ActionController::Base
  protect_from_forgery
  before_filter :conditions

	def conditions
		if((session[:history])==nil)
  			session[:history] = Array.new
		end
		if((session[:counter])==nil)
  			session[:counter] = 0
		end
	end
end
