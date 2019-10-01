# frozen_string_literal: true

require 'rails_helper'
require 'sidekiq/testing'
Sidekiq::Testing.fake!

RSpec.describe MonstersController, type: :controller do
  context 'DESTROY /users/:user_id/monster/:monster_id/' do
    let(:user_id) { User.create(username: 'killer1000').id }
    let(:monster_id) { Monster.create(name: 'Baby Shark').id }
    before do
      delete :destroy, params: { user_id: user_id, monster_id: monster_id }
    end

    after do 
      Sidekiq::Worker.clear_all
    end

    it 'respond with status success' do
      expect(response.status).to eql(200)
    end

    it 'enqueue a killed monster job in background' do
      expect(Audit::KilledMonsterWorker.jobs.size).to eql(1)
    end

    it %(data is 'killer1000 killed Baby Shark') do
      json_response = JSON.parse(response.body)
      expect(json_response['data']).to eql('killer1000 killed Baby Shark')
    end
  end
end
