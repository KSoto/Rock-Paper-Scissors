class ClearController < ApplicationController
  def index
    	session[:counter]=0
    	session[:history].clear
  end
end
