class ApplicationController < ActionController::Base
    def current_user
        return unless session[:user_id]
        @current_user ||= User.find(session[:user_id])
    end

    def logged_in?
        if current_user 
            return true
        else
            return false
        end
    end
end