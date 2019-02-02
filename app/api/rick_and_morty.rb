class RickAndMorty
  include HTTParty
  BASE_URL = 'https://rickandmortyapi.com/api/'

  def self.search_characters(params)
    if params[:name].nil? && params[:status].nil?
      result = HTTParty.get(BASE_URL + "character").to_json
    elsif params[:name].nil?
      result = HTTParty.get(BASE_URL + "character/?status=" + params[:status]).to_json
    elsif params[:status].nil?
      result = HTTParty.get(BASE_URL + "character/?name=" + params[:name]).to_json
    else
      result = HTTParty.get(BASE_URL + "character/?name=" + params[:name] + "&status=" + params[:status]).to_json
    end
  end
end
