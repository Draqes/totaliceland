require 'spec_helper'

describe PagesController do
  render_views

  # Home
  describe "GET 'home'" do
    it "should be successful" do
      get 'home'
      response.should be_success
    end
  
  it "should have the right title" do
    get 'home'
    response.should have_selector("title",
	:content => "Total Iceland | Home")
    end
  end

  # Contact
  describe "GET 'contact'" do
    it "should be successful" do
      get 'contact'
      response.should be_success
    end

    it "should have the right title" do
    get 'contact'
    response.should have_selector("title",
	:content => "Total Iceland | Contact")
    end
  end

  # About
  describe "GET 'about'" do
    it "should be successful" do
    get 'about'
    response.should be_success
    end
  
    it "should have the right title" do
    get 'about'
    response.should have_selector("title",
	:content => "Total Iceland | About")
    end
  end
end
