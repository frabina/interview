class Client < ApplicationRecord
	has_many :accounts, dependent: :destroy
	after_create :set_emp_code

	def set_emp_code
		self.update(emp_code: self.id.to_s.rjust(9, "0"))
	end
end
