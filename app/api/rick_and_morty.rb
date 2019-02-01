class RickAndMorty
  include HTTParty
  BASE_URL = 'https://rickandmortyapi.com/api'

  def self.search
    return HTTParty.get(BASE_URL + "/character")
  end
end
