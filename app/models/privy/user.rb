module Privy
  class User < ActiveRecord::Base

    self.table_name = :privy_users

    def self.authenticate(username, password)
      pwd = Digest::SHA256.new.update(password).to_s
      Privy::User.find(:first, :conditions => { :username => username, :password => pwd })
    end

    def self.logged_in?(session)
      session[:username] && session[:user_id]
    end

  end
end