module Privy
  class LogoutController < ApplicationController

  def index
    reset_session
    return_to_path = Privy::PrivyEngine.config.after_logout_return_to || session[:return_to]
    redirect_to return_to_path, :flash => { :privy_message => Privy::PrivyEngine.config.after_logout_message }
  end

  end
end