class RickAndMorty
  include HTTParty
  BASE_URL = 'https://rickandmortyapi.com/api/'

  def self.search_characters(params)
    if params[:name].nil? && params[:status].nil?
      result = HTTParty.get(BASE_URL + "character")
    elsif params[:name].nil?
      result = HTTParty.get(BASE_URL + "character/?status=" + params[:status])
    elsif params[:status].nil?
      result = HTTParty.get(BASE_URL + "character/?name=" + params[:name])
    else
      result = HTTParty.get(BASE_URL + "character/?name=" + params[:name] + "&status=" + params[:status])
    end
  end
end
