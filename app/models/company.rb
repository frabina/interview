class Company < ApplicationRecord
	validates :company_name, presence: true, length: { minimum: 5, message: "must be a minimum 5 character"}
	validates :email, presence: true, format: { with: URI::MailTo::EMAIL_REGEXP, message: "must be a valid email address" }
	validates :company_code, uniqueness: true, allow_nil: true, format: { 
		with: /\A[A-Za-z]{2}\d{2}[EN]\z/, 
		message: "must be 5 characters long with the first 2 as letters, the next 2 as digits, and ending with E or N"
	}
	validates :website, format: { with: URI::DEFAULT_PARSER.make_regexp, message: "must be a valid URL" }, allow_nil: true
end
