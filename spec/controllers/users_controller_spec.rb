require 'spec_helper'

describe UsersController do
  render_views

  describe "GET 'new'" do
    it "should be successful" do
      get :new
      response.should be_success
    end

     it "should have the right title" do
       get :new
       response.should have_selector("title", :content => "Sign up")
     end

     it "should have a name field" do
       get :new
       response.should have_selector("input[name='user[name]'][type='text']")
     end

     it "should have an email field"

     it "should have a password field"

     it "should have a password confirmation field"


  end

  describe "GET 'show'" do

    before(:each) do
      @user = Factory(:user)
      test_sign_in(@user)    
    end

    it "should be successful" do  
      get :show, :id => @user
      response.should be_success
    end
 
    it "should find the first user" do
      get :show, :id => @user
      # consider stubbing for seperating model and 
      # controller layers in Rails tests
      assigns(:user).should == @user
    end

    it "should have the right title" do
      get :show, :id => @user
      response.should have_selector("title", :content => @user.name)
    end

    it "should include the user's name" do
      get :show, :id => @user
      response.should have_selector("h1", :content => @user.name)
    end

  end

  describe "POST 'create'" do
    
    describe "failure" do
      before(:each) do
        @attr = {:name => "", :email => "", :password => "", :password_confirmation => ""}
      end

      it "should not create a user" do
        lambda do
          post :create, :user => @attr
        end.should_not change(User, :count) #check change in number of users in db
      end

      it "should have the right title" do
        post :create, :user => @attr
        response.should have_selector("title", :content => "Sign up")
      end

      it "should render the 'new' page" do
        post :create, :user => @attr
        response.should render_template('new')
      end

    end

    describe "success" do
    
      before(:each) do
        @attr = {:name => "New User", 
                 :email => "user@example.com",
                 :password => "foobar", 
                 :password_confirmation => "foobar"}
      end

      it "should create a user" do
        lambda do
          post :create, :user => @attr
        end.should change(User, :count).by(1) 
      end

      it "should redirect to the user show page" do
        post :create, :user => @attr
        response.should redirect_to(user_path(assigns(:user)))
      end

      it "should have a welcome message" do
        post :create, :user => @attr 
        flash[:success].should =~ /Welcome/i
      end

      it "should sign the user in" do
        post :create, :user => @attr
        controller.should be_signed_in
      end

    end
  end 

  describe "authentiction of show page" do

    before(:each) do
      @user = Factory(:user)
    end

    describe "for non signed in users " do

      it "should deny access to 'show'" do
        get :show, :id => @user
        response.should redirect_to(signin_path)
      end

      it "should test more user controller actions"
 
    end

    describe "for signed in users" do
    
      before(:each) do
        wrong_user = Factory(:user, :email => "user@example.net")
        test_sign_in(wrong_user)
      end

      it "should require a matching user for 'show'" do
        get :show, :id => @user
        response.should redirect_to(root_path)
      end

    end

  end


end
