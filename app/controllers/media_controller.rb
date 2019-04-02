class MediaController < ApplicationController
  def index
    movies_result = HTTParty.get('https://api.themoviedb.org/3/search/movie?api_key=2e4bf3ae7a9007a8ff8ac9fbfdeb67d5&language=en-US&query=samurai&page=1&include_adult=true')
    movies_list = JSON.parse(movies_result.to_s)
    @movies = movies_list['results']

    tvshows_result = HTTParty.get('https://api.themoviedb.org/3/search/tv?api_key=2e4bf3ae7a9007a8ff8ac9fbfdeb67d5&language=en-US&query=samurai&page=1')
    tvshows_list = JSON.parse(tvshows_result.to_s)
    @tvshows = tvshows_list['results']

    books_result = HTTParty.get('https://www.googleapis.com/books/v1/volumes?q=samurai&printType=books&maxResults=15&key=AIzaSyAwLGxNQqntI0-yaJ5DeFbudX_DrugiUK8')
    books_list = JSON.parse(books_result.to_s)
    @books = books_list['items']
  end

  def new
  end

  def edit
  end

  def show
  end
end
