class UsersController < ApplicationController
	before_filter :authenticate_user!

	def index
		# @user = current_user
		# response = Echowrap.song_search(artist: "Weezer")
		# response = Echowrap.song_search(:artist)
		# @artist = response[0].artist_name
		@user = current_user
		@new_profile = Profile.new
	end

	def create
		@new_profile = Profile.new(profile_params)
		if @profile.save
			redirect_to users_path, notice: "Item added."
		else
			redirect_to :back, alert: "Failed to save."
		end
	end

	# def spotify_player
	# 	play_artist
	# end

	# def play_artist
	# 	artist => spotify_player
	# end

end
