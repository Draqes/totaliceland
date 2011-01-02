class ApplicationController < ActionController::Base
  protect_from_forgery

  #Have sessions helper available in all controllers
  include SessionsHelper

end
