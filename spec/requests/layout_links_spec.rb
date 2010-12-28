require 'spec_helper'

describe "LayoutLinks" do

  # Testing routes
  it "Should have a Home page at '/'" do
    get '/'
    response.should have_selector('title', :content => "Home")
  end

  it "should have a Contact page at '/contact'" do
    get '/contact'
    response.should have_selector('title', :content => "Contact")
  end 

  it "should have About page at '/about'" do
    get '/about'
    response.should have_selector('title', :content => "About")
  end

  # Testing links

  it "should have the right links on the layout" do
    visit root_path
    click_link "About"
    response.should have_selector('title', :content => "About")
    click_link "Contact"
    response.should have_selector('title', :content => "Contact")
    click_link "Home"
    response.should have_selector('title', :content => "Home")
    click_link "Sign Up"
    response.should have_selector('title', :content => "Sign up")

  end

end
