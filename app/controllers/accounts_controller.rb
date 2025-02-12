class AccountsController < ApplicationController
	before_action :set_client
	def new
		@account = @client.accounts.build
		respond_to do |format|
			format.js 
		end
	end

	def create
		@account = @client.accounts.build(account_params)
		if @account.save
			respond_to do |format|
				format.js 
			end
		else
			render :new, status: :unprocessable_entity
		end
	end

	private

	def set_client
		@client = Client.find_by(id: params[:client_id])
	end

	def account_params
		params.require(:account).permit(:account_number, :branch)
	end
end
