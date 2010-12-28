require 'spec_helper'

describe User do

  # Setup
  before(:each) do
    @attr = {:name => "Example User", :email => "user@example.com"}
  end

  # Tests
  it "should create a new instance given valid attributes" do
    User.create!(@attr)
  end
  
  # Username
  it "should require a name" do
    no_name_user = User.new(@attr.merge(:name => ""))
    no_name_user.should_not be_valid
  end

  it "should not accept long usernames" do
    long_name = "a" * 51
    long_name_user = User.new(@attr.merge(:name => long_name))
    long_name_user.should_not be_valid
  end

  # Email
  it "should require an email" do
    no_email_user = User.new(@attr.merge(:email => ""))
    no_email_user.should_not be_valid
  end

  it "should accept valid email addresses" do
    addresses = %w[user@foo.com THE_USER@foo.bar.org first.last@foo.jp]
    addresses.each do |address|
      valid_email_user = User.new(@attr.merge(:email => address))
      valid_email_user.should be_valid
    end
  end

  it "should reject invalid email addresses" do
    addresses = %w[user@foo,com user_at_foo.org user@foo. user@foo_bar.com user@foo]
    addresses.each do |address|
      invalid_email_user = User.new(@attr.merge(:email => address))
      invalid_email_user.should_not be_valid
    end
  end

  it "should reject duplicate emails" do
     #Create user and write to db, use create! to raise exception
     User.create!(@attr)
     duplicate_user = User.new(@attr)
     duplicate_user.should_not be_valid
  end

  it "should reject duplicate addresses identical to up case" do
    upcase_email = @attr[:email].upcase
    User.create!(@attr.merge(:email => upcase_email))
    dupe_email_user = User.new(@attr)
    dupe_email_user.should_not be_valid   
  end

end
