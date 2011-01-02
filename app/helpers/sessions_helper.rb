module SessionsHelper

  def sign_in(user)
    cookies.permanent.signed[:remember_token] = [user.id, user.salt]
    current_user = user
  end

  def sign_out
    cookies.delete(:remember_token)
    current_user = nil
  end

  # assignment function
  def current_user
    @current_user ||= user_from_remember_token
    # assigned only if @current_user is undefined
  end

  def signed_in?
    !current_user.nil?
  end

  private

  def user_from_remember_token
    User.authenticate_with_salt(*remember_token)
    # authenticate_with_salt method takes two arguments
  end

  def remember_token
    cookies.signed[:remember_token] || [nil,nil]
    # return an array of nil values if cookies.signed[:remember_me] itself is nil
  end

end
