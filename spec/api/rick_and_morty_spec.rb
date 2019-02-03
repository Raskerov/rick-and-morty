require 'rails_helper'

describe RickAndMorty do

  BASE_URL = 'https://rickandmortyapi.com/api/'
  #Each API mock is designed for specific call, do not change

  context 'when called' do
    context 'with no search params' do
      it "return JSON data pack" do
        #Mock API
        stub_request(:get, BASE_URL + "character")
          .to_return(body: file_fixture('characters.json').read)

        result = JSON.parse(RickAndMorty.characters) #Parse JSON to use json_matcher
        expect(result).to include_json(expected_response)
      end
    end

    context 'with name search params' do
      it "return JSON data pack" do
        #Mock API
        stub_request(:get, BASE_URL + "character/?name=Rick")
          .to_return(body: file_fixture('name_rick_characters.json').read)

        result = JSON.parse(RickAndMorty.name_query(params_with_name)) #Parse JSON to use json_matcher
        expect(result).to include_json(expected_response)
      end
    end

    context 'with status search params' do
      it "return JSON data pack" do
        #Mock API
        stub_request(:get, BASE_URL + "character/?status=alive")
          .to_return(body: file_fixture('status_alive_characters.json').read)

        result = JSON.parse(RickAndMorty.status_query(params_with_status)) #Parse JSON to use json_matcher
        expect(result).to include_json(expected_response)
      end
    end

    context 'with status and name search params' do
      it "return JSON data pack" do
        #Mock API
        stub_request(:get, BASE_URL + "character/?name=Rick&status=alive")
          .to_return(body: file_fixture('name_and_status_characters.json').read)

        result = JSON.parse(RickAndMorty.name_and_status_query(all_params)) #Parse JSON to use json_matcher
        expect(result).to include_json(expected_response)
      end
    end
  end

  private

  def no_params
    {
      name: nil,
      status: nil
    }
  end

  def params_with_name
    {
      name: "Rick",
      status: nil
    }
  end

  def params_with_status
    {
      name: nil,
      status: "alive"
    }
  end

  def all_params
    {
      name: "Rick",
      status: "alive"
    }
  end

  def expected_response # Picked fragment from fixture, contains variables for each test (Name, status)
   {'results':
     [
       {
         "name": "Rick Sanchez",
         "status": "Alive",
         "species": "Human",
         "gender": "Male",
         "location": {
           "name": "Earth (Replacement Dimension)"
         },
         "image": "https://rickandmortyapi.com/api/character/avatar/1.jpeg"
       }
     ]
   }
  end
end
