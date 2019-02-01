class RickAndMorty
  include HTTParty
  BASE_URL = 'https://rickandmortyapi.com/api/'

  def self.search_characters(name, status)
    if name.nil? && status.nil?
      result = HTTParty.get(BASE_URL + "character").to_json
    elsif name.nil?
      result = HTTParty.get(BASE_URL + "character/?status=" + status).to_json
    elsif status.nil?
      result = HTTParty.get(BASE_URL + "character/?name=" + name).to_json
    else
      result = HTTParty.get(BASE_URL + "character/?name=" + name + "&status=" + status).to_json
    end
  end
end
