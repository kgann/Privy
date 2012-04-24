module Privy
  class UsersController < ApplicationController
    before_filter :authorize

    def index
      render :json => Privy::User.all
    end

    def show
      render :json => Privy::User.find(params[:id])
    end

    def edit
      render :json => Privy::User.find(params[:id])
    end

    def create
      render :text => "Create User #{params}"
    end

  end
end