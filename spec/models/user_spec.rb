require 'spec_helper'

describe User do
  # Setup
  before(:each) do
    @attr = {:name => "Don Johnson", :email => "don@miami_vice.com"}
  end
  # Test
  it "should create a new instance given valid attributes" do
    User.create!(@attr)
  end
  
  it "should require a name" do
    no_name_user = User.new(@attr.merge(:name => ""))
    no_name_user.should_not be_valid
  end

  it "should require an email" do
    no_email_user = User.new(@attr.merge(:email => ""))
    no_email_user.should_not be_valid
  end

  it "should not accept username with less than 4 chars"
end
