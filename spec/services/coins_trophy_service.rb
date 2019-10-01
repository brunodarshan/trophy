# frozen_string_literal: true

require 'rails_helper'

RSpec.describe CoinsTrophyService, type: :service do
  describe 'Set user and process queries to find or create' do
    let(:user) { User.create(username: 'foobar') }
    before do
      [10, 100, 120].each do | value | 
        ColletedCoin.create(
            user_id: user.id,
            value: value
        )
      end
      CoinsTrophyService.new(user.id).call
    end

    it 'create trophies' do
        trophys = CoinsTrophy.where(user_id: user.id)
        expect(trophys.size).to_not eql(0)
    end

    it 'has 2 trophies of coins' do
        trophys = CoinsTrophy.where(user_id: user.id)
        expect(trophys.size).to eql(2)
    end

    it 'do not create duplicate drophies' do 
      CoinsTrophyService.new(user.id).call
      trophys = CoinsTrophy.where(user_id: user.id)
      expect(trophys.size).to eql(2)
    end
  end
end
