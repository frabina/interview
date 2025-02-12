class CompaniesController < ApplicationController
	skip_before_action :verify_authenticity_token
	before_action :set_company, only: [:show, :edit, :update, :destroy]

	def index
		per_page = params[:per_page] || 5
		@comapanies = Company.page(params[:page]).per(per_page)
		render json: @comapanies
	end

	def new
		@company = Company.new
	end

	def create
		@company = Company.new(company_params)
		if @company.save
			render json: @company, status: :created
		else
			render json: @company.errors, status: :unprocessable_entity
		end
	end

	def show
		render json: @company
	end

	def edit

	end

	def update
		@company.update(company_params)
		if @company.save
			render json: @company, status: :created
		else
			render json: @company.errors, status: :unprocessable_entity
		end
	end

	def destroy
		@company.destroy
		render json: {message: "Company #{@company.company_name} deleted successfully"}
	end

	private

	def set_company
		@company = Company.find_by(id: params[:id])
	end

	def company_params
		params.require(:company).permit(:company_name, :email, :company_code, :strength, :website)
	end
end
