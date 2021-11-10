RSpec.describe 'User', type: :request do
  describe "PUT /api/v1/questions/:id" do

    it 'returns success' do
      post "/api/v1/users", params: { first_name: 'Quim', last_name: 'Barreiros', admin: true }

      expect(response.status).to eq(201)
      # ....

    end

    it 'returns error' do
      post "/api/v1/users", params: { first_name: '', last_name: '', admin: true }

      expect(response.status).to eq(422)
      # ....
    end
  end
end