# frozen_string_literal: true

require 'rails_helper'

RSpec.describe CoinsController do
  describe 'POST collet coins' do
    it 'respond status success' do
      user = User.create(username: 'foo_bar')
      post :create, params: {value: 10, user_id: user.id}, format: :json
      expect(response.status).to eql(200)
    end
  end
end
