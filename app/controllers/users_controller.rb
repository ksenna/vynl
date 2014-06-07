class UsersController < ApplicationController
	before_filter :authenticate_user!

	def index
		# @user = current_user
		# response = Echowrap.song_search(artist: "Weezer")
		# response = Echowrap.song_search(:artist)
		# @artist = response[0].artist_name
	end

	# def spotify_player
	# 	play_artist
	# end

	# def play_artist
	# 	artist => spotify_player
	# end

end
