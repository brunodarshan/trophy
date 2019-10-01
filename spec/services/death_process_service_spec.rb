# frozen_string_literal: true

require 'rails_helper'

RSpec.describe DeathProcessService, type: :service do
  describe 'verify and create trophies about user death' do
    let(:user) { User.create(username: 'BabyShark95') }
    before do
      10.times do
        Death.create(user_id: user.id)
      end
      DeathProcessService.new(user.id).call
    end

    it 'create 2 death trophies' do
      expect(user.death_trophies.size).to eql(2)
    end
  end
end
