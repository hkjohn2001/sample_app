module SessionsHelper
  
  def sign_in(user)
    cookies.permanent.signed[:remember_token] = [user.id, user.salt]
    current_user = user 
  end
  
  def current_user=(user)
    @current_user = user
  end 
  
  def current_user
    # ||= or/equals, keeps from hitting database if true already 
    @current_user ||= user_from_remember_token
  end
  
  def signed_in?
    !current_user.nil?
  end 
  
  def sign_out
    cookies.delete(:remember_token)
    current_user = nil
  end
  
  def deny_access 
    redirect_to signin_path, :notice => "Please sign in to access this page. "
  end
  
  private
  
    def user_from_remember_token
      #remember token has two components * unwraps hash and passes two parameters to authenticate_with_salt
      User.authenticate_with_salt(*remember_token)
    end
    
    def remember_token
      cookies.signed[:remember_token] || [nil, nil]
    end 

  
end

