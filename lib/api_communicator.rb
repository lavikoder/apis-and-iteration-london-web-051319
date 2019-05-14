require 'rest-client'
require 'json'
require 'pry'

def get_info(api_hash, char_name)
  api_hash["results"].each do |hash|
    hash.each do |key, val| #binding.pry
      if val == char_name
        return hash["films"]  #returning array of film urls
      end
    end
  end
end

def get_character_movies_from_api(character_name)
  response_string = RestClient.get('http://www.swapi.co/api/people/')
  response_hash = JSON.parse(response_string)
  films_arr = get_info(response_hash, character_name)
  new_films_arr = []

  films_arr.each do |url|
    film_info = RestClient.get(url)
    film_hash = JSON.parse(film_info)
    new_films_arr << film_hash
  end
  new_films_arr
end

def print_movies(films)
  film_arr = []
  films.each do |hash|
    puts "
    \nTitle:  #{hash["title"]}
    \nEpisode:  #{hash["episode_id"]}
    \nOpening Crawl: #{hash["opening_crawl"]}
    \nDirector: #{hash["title"]}
    \nRelease Date: #{hash["title"]}
    \n-----------------------------"
  end
end

def show_character_movies(character)
  films = get_character_movies_from_api(character)
  print_movies(films)
end

def show_starship_specs(starship)
  # iterate through starship hash
  # find info for starship and send back
end

## BONUS

# that `get_character_movies_from_api` method is probably pretty long. Does it do more than one job?
# can you split it up into helper methods?
# get_character_movies_from_api("Luke Skywalker")
