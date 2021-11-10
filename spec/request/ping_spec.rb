RSpec.describe 'Ping', type: :request do
  describe 'GET /ping' do
    subject { get '/api/v1/ping' }

    it 'returns success' do
      subject

      expect(response).to have_http_status(200)
    end
  end
end