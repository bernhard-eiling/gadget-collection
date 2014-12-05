class MainController < ApplicationController
  def index
    puts logged_in?
  end
end