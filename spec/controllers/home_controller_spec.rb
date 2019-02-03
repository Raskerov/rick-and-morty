require 'rails_helper'

RSpec.describe HomeController, type: :controller do

  BASE_URL = 'https://rickandmortyapi.com/api/'

  describe "GET index" do
    context 'with no params' do
      it "returns status 200" do
        stub_request(:get, "https://rickandmortyapi.com/api/character")

        get :index
        expect(response).to have_http_status(200)
      end
    end

    context 'with name params' do
      it "returns status 200" do
        stub_request(:get, BASE_URL + "character/?name=Rick")

        get :index, params: { name: "Rick" }
        expect(response).to have_http_status(200)
      end
    end

    context 'with status params' do
      it "returns status 200" do
        stub_request(:get, BASE_URL + "character/?status=alive")

        get :index, params: { status: 'alive' }
        expect(response).to have_http_status(200)
      end
    end

    context 'with name and status params' do
      it "returns status 200" do
        stub_request(:get, BASE_URL + "character/?name=Rick&status=alive")

        get :index, params: { name: "Rick", status: 'alive' }
        expect(response).to have_http_status(200)
      end
    end
  end
end
