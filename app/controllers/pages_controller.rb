class PagesController < ApplicationController
  
  def home
    @title = "Home"
  end

  def signin
    @title = "Sign In"
  end

  def about
    @title = "About"
  end

end
