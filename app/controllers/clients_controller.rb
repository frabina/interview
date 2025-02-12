class ClientsController < ApplicationController

	before_action :set_client, only: [:show, :edit, :update, :destroy]

	def index
		@clients = Client.page(params[:page]).per(10)
		@clients = Client.includes(:accounts).page(params[:page]).per(10)
	end

	def new
		@client = Client.new
	end

	def create
		@client = Client.new(client_params)
		if @client.save
			redirect_to clients_path, notice: "Client created successfully"
		else
			render :new
		end
	end

	def show
	end

	def edit
	end

	def update
		if @client.update(client_params)
			redirect_to clients_path, notice: "Client updated successfully"
		else
			render :edit
		end
	end

	def destroy
		@client.destroy
		redirect_to clients_path, notice: "Client Deleted successfully"
	end

	private

	def set_client
		@client = Client.find_by(id: params[:id])
	end

	def client_params
		params.require(:client).permit(:name, :email, :emp_code)
	end
end
