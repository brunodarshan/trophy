# frozen_string_literal: true

require 'rails_helper'

RSpec.describe UsersController, type: :controller do
  context 'PUT /update (kill user)' do
    let(:user) { User.create(username: 'foo_bar') }
    before do 
        put :update, params: { id: user.id }
    end
    it 'PUT respond with success to death' do
      expect(response.status).to eql(200)
    end

    it 'user has a death' do
      expect(user.deaths.size).to eql(1)
    end
  end
end
