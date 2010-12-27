require 'spec_helper'

describe "LayoutLinks" do

  it "Should have a Home page at '/'" do
    get '/'
    response.should have_selector('title', :content => "Home")
  end

  it "should have a Sign In page at '/signin'" do
    get '/signin'
    response.should have_selector('title', :content => "Sign In")
  end 

  it "should have About page at '/about'" do
    get '/about'
    response.should have_selector('title', :content => "About")
  end

end
