# frozen_string_literal: true

class CoinsController < ApplicationController
  def create
    @colleted_coins = ColletedCoin.new(collet_coins_params)
    if @colleted_coins.save
      # TO DO -> perform verify if can generate trophy
      render json: nil, status: :ok
    else
      render json: { status: :error, data: @colleted_coins.errors }, status: :unauthorized
    end
  end

  private

  def collet_coins_params
    params.permit(:value, :user_id)
  end
end
