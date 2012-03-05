class ApplicationController < ActionController::Base
  protect_from_forgery
before_filter do
  session[:history] = Array.new
  session[:counter] = 0
end
end
