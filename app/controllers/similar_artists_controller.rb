class SimilarArtistsController < ApplicationController

	def index
		
	end

	def new
		@similar = SimilarArtist.new
	end

	def create
		@similar = SimilarArtist.new(similar_params)
		if @similar.save
			response = Echowrap.song_search(@similar)
			sim_artists = Echowrap.artist_similar(:id => response[0].artist_id, :results => 3)
		else
			render :new, alert: "Oops, there was an error."
		end
	end



	def show
		response = Echowrap.song_search(:string)
		similar = Echowrap.artist_similar(:id => response[0].artist_id, :results => 3)
		@artists = [similar[0], similar[1], similar[2]]
	end

	def check_string
		if @string
			response = Echowrap.song_search(:string)
			similar = Echowrap.artist_similar(:id => response[0].artist_id, :results => 3)
		else
			get_string
		end
	end

	# def get_string
	# 	if params[:string]
	# 		respond_to do |format|
	# 		response = Echowrap.song_search(:string)
	# 		similar = Echowrap.artist_similar(:id => response[0].artist_id, :results => 3)
	# 	end
	# end

	private

	def similar_params
		params.require(:similar_artist).permit!
	end


	def pull_key
		key = Rails.application.secrets.echo_key
		secret = Rails.application.secrets.echo_secret
	end

end