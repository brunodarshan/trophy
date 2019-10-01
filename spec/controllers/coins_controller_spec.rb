# frozen_string_literal: true

require 'rails_helper'
require 'sidekiq/testing'
Sidekiq::Testing.fake!

RSpec.describe CoinsController do
  describe 'POST collet coins' do
    let(:user) { user = User.create(username: 'foo_bar') }
    before do
      post :create, params: {value: 10, user_id: user.id}, format: :json
    end
    
    it 'respond status success' do
      expect(response.status).to eql(200)
    end

    it 'has a job in background' do
      expect(Audit::CoinsWorker.jobs.size).to_not eql(0)
    end
  end
end
