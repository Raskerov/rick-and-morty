require 'rails_helper'

describe RickAndMorty do

  context 'when called' do
    it "return JSON data pack" do
      #Mock API
      stub_request(:get, "https://rickandmortyapi.com/api/character")
        .to_return(body: file_fixture('characters.json').read)

      result = JSON.parse(RickAndMorty.search_characters(no_params)) #Parse JSON to use json_matcher
      expect(result).to include_json(expected_response)
    end
  end

  private

  def no_params
    {name: nil,
     status: nil}
  end

  def expected_response # Picked fragment from fixture
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
