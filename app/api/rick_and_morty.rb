class RickAndMorty
  include HTTParty

  BASE_URL = 'https://rickandmortyapi.com/api/'

  def self.characters
    HTTParty.get(BASE_URL + "character")
  end

  def self.name_query(params)
    HTTParty.get(BASE_URL + "character/?name=" + params[:name])
  end

  def self.status_query(params)
    HTTParty.get(BASE_URL + "character/?status=" + params[:status])
  end

  def self.name_and_status_query(params)
    HTTParty.get(BASE_URL + "character/?name=" + params[:name] + "&status=" + params[:status])
  end
end
