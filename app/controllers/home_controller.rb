class HomeController < ApplicationController

  def index
    @characters = []
    split_characters(JSON.parse(RickAndMorty.search_characters(params[:name], params[:status])).slice("results"))
  end

  private

  def split_characters(characters)
    characters['results'].each do |c|
      hero = {
        name: c['name'],
        status: c['status'],
        species: c['species'],
        gender: c['gender']
      }
      @characters << hero
    end
  end
end
