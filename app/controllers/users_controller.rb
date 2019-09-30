# frozen_string_literal: true

class UsersController < ApplicationController
  before_action :set_user, only: [:update]

  def update
    @death = @user.deaths.new
    if @death.save
      # TO DO
      render json: nil, status: :ok
    else
      render json: {
        msg: :error, data: @death.errors
      }, status: :unauthorized
    end
  end

  private

  def set_user
    @user = User.find params[:id]
  end
end
