class HomeController < ApplicationController

  def index
    @characters = []
    split_characters(JSON.parse(call_api).slice("results"))
  end

  private

  def call_api
    RickAndMorty.search_characters(params)
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
end
