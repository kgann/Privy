module Privy
  class LoginController < ApplicationController
    skip_before_filter :setup_return_to

    def index
      render :partial => 'login_form'
    end

    def login
      if user = Privy::User.authenticate(params[:privy_user][:username], params[:privy_user][:password])
        return_to_path = Privy::PrivyEngine.config.login_success_return_to || session[:return_to]
        reset_session
        session[:user_id], session[:username] = user.id, user.username
        flash[:privy_message] = Privy::PrivyEngine.config.login_success_message
      else
        flash[:privy_message] = Privy::PrivyEngine.config.login_failure_message
        return_to_path = Privy::PrivyEngine.config.login_failure_return_to || login_path
      end

      respond_to do |format|
        format.html { redirect_to return_to_path }
        format.json { render :json => { :success => user.nil?, :message => flash[:privy_message] }}
      end
    end

  end
end