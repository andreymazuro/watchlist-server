require 'rails_helper'

RSpec.describe "MoviesDups", type: :request do
      it "creates two users with wright e-mail" do
        post "/users",
        params: { name: "johnny", email: "arsdf@gmail.com", password: "123456" }
        expect(response.content_type).to eq "application/json"
        expect(response).to have_http_status(200)
      end


end
