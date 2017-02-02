require "rails_helper"

RSpec.describe UsersController, :type => :controller do

  before do
    post :create, params: {name: "john", password: "123456", email: "sdfds@gamil.com"}
   end

  describe "POST #auth" do
    it "renders token" do
        post :auth, params: {name: "john", password: "123456"}
        expect(response.content_type).to eq "application/json"
        expect(response).to have_http_status(200)
    end

    it "renders error" do
        post :auth, params: {name: "john", password: "12233456"}
        expect(response.content_type).to eq "text/plain"
        expect(response).to have_http_status(403)
    end

  end

end
