# frozen_string_literal: true

require 'rails_helper'
require 'sidekiq/testing'
Sidekiq::Testing.fake!

RSpec.describe UsersController, type: :controller do
  context 'PUT /update (kill user)' do
    let(:user) { User.create(username: 'foo_bar') }
    before do 
        put :update, params: { id: user.id }
    end

    after do 
      Sidekiq::Worker.clear_all
    end

    it 'PUT respond with success to death' do
      expect(response.status).to eql(200)
    end

    it 'user has one death' do
      expect(user.deaths.size).to eql(1)
    end

    it 'enqueue one job of trophies' do
      expect(Audit::DeathsWorker.jobs.size).to eql(1)
    end
  end
end
