module SessionsHelper
    # Logs in the given user.
    def log_in(user)
        session[:user_id] = user.id
    end

    # returns the logged in user (or nil if no user is logged in)
    def current_user
        User.find_by(id: session[:user_id])
    end
 
    def admin?
        user = current_user
        if logged_in?
           return user.is_admin
        else
           return false
        end
    end

    def logged_in?
        if !current_user.nil?
            return true
        else
            return false
        end
    end
 
    def require_logged_in
        if !logged_in?
            redirect_to login_url, notice:"Please log in"
        end
    end

    # Logs out the current user.
    def log_out
        session.delete(:user_id)
    end
end