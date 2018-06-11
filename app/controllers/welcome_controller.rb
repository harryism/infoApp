class WelcomeController < ApplicationController

  def info

  end


  def map
    @users = User.all
  end
end