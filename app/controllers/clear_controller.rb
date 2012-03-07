class ClearController < ApplicationController
  def index
    	session[:counter] = nil
    	session[:history] = nil
  end
end
