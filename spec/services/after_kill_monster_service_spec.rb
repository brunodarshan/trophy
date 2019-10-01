# frozen_string_literal: true

require 'rails_helper'

RSpec.describe AfterKillMonsterService, type: :service do
  describe 'verify and create trophies about user kills' do
    let(:user) { User.create(username: 'BabyShark95') }
    let(:baby_shark) { Monster.create(name: 'Baby Shark') }

    context 'when have 2 kills of a monster' do
      before do
        2.times do KilledMonster.create(user_id: user.id, monster_id: baby_shark.id) end
        AfterKillMonsterService.new(user.id, baby_shark.id).call
      end

      it 'create one trophy for a monster killed' do
        expect(user.killed_monster_trophies.size).to eql(1)
      end
    end

    context 'when have 100 kills of a monster' do
      before do
        100.times do KilledMonster.create(user_id: user.id, monster_id: baby_shark.id) end
        AfterKillMonsterService.new(user.id, baby_shark.id).call
      end
      
      it 'create two trophies for monster kill' do
        expect(user.killed_monster_trophies.size).to eql(2)
      end
    end

  end
end
