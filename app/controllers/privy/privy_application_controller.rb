module Privy
  module PrivyApplicationController
    def self.included(base)
      base.send :include, PrivateMethods
      base.before_filter :setup_return_to
    end

    def setup_return_to
      session[:return_to] = Privy::PrivyEngine.config.return_to ? request.url : root_path
    end

    module PrivateMethods
      private
      def authorize
        redirect_to login_path unless Privy::User.logged_in? session
        get_new_session
      end

      def get_new_session
        user, id, return_to = session[:username], session[:user_id], session[:return_to]
        reset_session
        session[:username], session[:user_id], session[:return_to] = user, id, return_to
      end
    end
  end
end