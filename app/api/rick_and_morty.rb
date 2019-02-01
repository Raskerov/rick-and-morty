class RickAndMorty
  include HTTParty
  BASE_URL = 'https://rickandmortyapi.com/api/'

  def self.search_characters
    result = HTTParty.get(BASE_URL + "character").to_json
    JSON.parse(result).slice("results")
  end
end
