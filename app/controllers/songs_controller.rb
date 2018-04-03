class SongsController < ApplicationController
  get '/songs' do
    @songs = Song.all

    erb :'/songs/index'
  end

  get '/songs/new' do

    @genres = Genre.all
    # @landmarks = Landmark.all

    erb :'/songs/new'
  end

  post '/songs' do
    # binding.pry
# @figure = Figure.create(params[:figure])
  # p 'tes'

  # cuz Name is just a string
  @song = Song.create(name: params[:Name])
  # @artist = Artist.create(name: params["Artist Name"])
  @song.artist = Artist.create(name: params["Artist Name"])

  # @genre = Genre.create(name: genre_name)
  # binding.pry
  # the genres already exist.
  # @genre = Genre.create(params[:genres])
  # might be an issue with this down the road
  @genre = Genre.find_by(id: params[:genres][0])
  @song.song_genres.create(genre: @genre)

  @song.save

  redirect to("/songs/#{@song.slug}")
  # LF using param genres
# #
# #
# if !params["title"]["name"].empty?
#   @figure.titles << Title.create(name: params["title"]["name"])
# end
# if !params["landmark"]["name"].empty?
#   @figure.landmarks << Landmark.create(name: params["landmark"]["name"])
# end
#
# @title.save
# redirect "owners/#{@owner.id}"
end

  get '/songs/:slug' do
    # @songs = Song.all
    # this is tested to work..
    # p Song.all

    # class method.. spelt right, given an arg. arg has contents..
    # but doesnt return anything..
    # find by something else?
    @song = Song.find_by_slug(params[:slug])
    # binding.pry


    erb :'/songs/show'
  end


end
