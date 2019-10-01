# frozen_string_literal: true

require 'rails_helper'

RSpec.describe MonstersController, type: :controller do
  context 'DESTROY /users/:user_id/monster/:monster_id/' do
    let(:user_id) { User.create(username: 'killer1000').id }
    let(:monster_id) { Monster.create(name: 'Baby Shark').id }
    before do
      delete :destroy, params: { user_id: user_id, monster_id: monster_id }
    end

    it 'respond with status success' do
      expect(response.status).to eql(200)
    end

    it %(data is 'killer1000 killed Baby Shark') do
      json_response = JSON.parse(response.body)
      expect(json_response['data']).to eql('killer1000 killed Baby Shark')
    end
  end
end
