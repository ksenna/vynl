class AlbumCoversController < ApplicationController

	def index
		@similar = Similar.all
	end

	def new
		@similar = Similar.find(params[:id])
		
	end

	def show
		response = Echowrap.song_search(:artist)
		similar = Echowrap.artist_similar(:id => response[0].artist_id, :results => 3)
		@artists = [similar[0], similar[1], similar[2]]
	end

	private

	def pull_key
		key = Rails.application.secrets.echo_key
		secret = Rails.application.secrets.echo_secret
	end


end