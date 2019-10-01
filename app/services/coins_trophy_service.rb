# frozen_string_literal: true

class CoinsTrophyService
  def initialize(user_id)
    @user = User.find(user_id)
    @all_coins = ColletedCoin.where(user_id: user_id).sum(:value)
    @last_coin_trophy = CoinsTrophy.where(user_id: user_id).last
  end

  def call
    resolve_coin_trophy
  end

  private

  def resolve_coin_trophy
    # byebug
    if @all_coins >= 1
      search_or_create_trophy_by_quantity 1
    end
    if @all_coins >= 10**2
      search_or_create_trophy_by_quantity 10**2
    end
    if @all_coins >= 10**3
      search_or_create_trophy_by_quantity 110**3
    end
    if @all_coins >= 10**4
      search_or_create_trophy_by_quantity 10**4
    end
  end

  def search_or_create_trophy_by_quantity(quantity)
    @user.coins_trophies.find_or_create_by(quantity: quantity)
  end
end
