require 'rails_helper'

RSpec.describe HomeController, type: :controller do


describe "GET index" do
    it "returns status 200" do
      stub_request(:get, "https://rickandmortyapi.com/api/character")
        .to_return(body: file_fixture('characters.json').read)
      get :index
      expect(response).to have_http_status(200)
    end
  end
end
