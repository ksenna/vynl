class API::UserController < ApplicationController

	http_basic_authenticate_with :name => "hpuser", :password => "hp123pass"
	skip_before_filter :authenticate_user!
	before_filter :find_user, :except => [:index, :create]

	def find_user
		@user = User.find_by_id(params[:id])
	end

	def index
		@users = User.all
		respond_to do |format|
			format.json { render :json => @users }
		end
	end

	def show
		respond_to do |format|
			format.json { render :json => @user }
		end
	end

	def create
		@user = User.new(params[:user])
		@user.temp_password = Devise.friendly_token
		respond_to do |format|
			if @user.save
				format.json {render json: @user, status: :created}
			else
				format.json {render json: @user.errors, status: :unprocessable_entity}
			end
		end
	end

	def update
		respond_to do |format|
			if @user.update_attributes(params[:user])
				format.json {head :no_content, status: :ok}
			else
				format.json {render json: @user.errors, status: :unprocessable_entity}
			end
		end
	end

	def destroy
		respond_to do |format|
			if @user.destroy
				format.json {head :no_content, status: :ok}
			else
				format.json {render json: @user.errors, status: :unprocessable_entity}
			end
		end
	end

end