class SessionsController < ApplicationController
  
    def login
        render :new
    end
  
    def sign_in
      user = User.find_by(email: params["email"])
      if user && user.authenticate(params["password"])
        session[:user_id] = user.id
        redirect_to '/'
      else
        render :login
      end
    end
  
    def sign_out
      session[:user_id] = nil
      redirect_to '/'
    end
end