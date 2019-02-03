class HomeController < ApplicationController

  def index
    @characters = []
    select_api_call_by_params(params)
  end

  private

  def select_api_call_by_params(params)
    if params[:name] && params[:status] #When both params are provided
      split_characters(search_by_name_and_status)
    elsif params[:name] && params[:status].nil? #Only name
      split_characters(search_by_name)
    elsif params[:name].nil? && params[:status]#Only status
      split_characters(search_by_status)
    else #No params provided, return with no query
      split_characters(characters)
    end
  end

  def split_characters(characters)
    unless characters.empty?
      characters['results'].each do |c|
        hero = {
          name: c['name'],
          status: c['status'],
          species: c['species'],
          gender: c['gender'],
          location: c['location']['name'],
          image: c['image']
        }
        @characters << hero
      end
    end
  end

  def characters
    JSON.parse(RickAndMorty.characters.to_json).slice("results")
  end

  def search_by_status
    JSON.parse(RickAndMorty.status_query(params).to_json).slice("results")
  end

  def search_by_name
    JSON.parse(RickAndMorty.name_query(params).to_json).slice("results")
  end

  def search_by_name_and_status
    JSON.parse(RickAndMorty.name_and_status_query(params).to_json).slice("results")
  end
end
