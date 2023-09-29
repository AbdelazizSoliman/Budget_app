require 'rails_helper'

RSpec.describe 'Pages', type: :request do
  describe 'GET /hello' do
    it 'returns http success' do
      get '/pages/hello'
      expect(response).to have_http_status(:success)
    end
  end
end
