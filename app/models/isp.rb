require 'resolv'
class Isp < ActiveRecord::Base
	has_many :requests
	has_many :ip_ranges
	has_many :isp_hrs
	has_many :notes
	has_many :isp_adsl_accounts
	validates  :name ,  presence: true , uniqueness: { case_sensitive: false }



	def self.search(term)
		if term
			where('name LIKE ?', "%#{term}%")
		else
			all
		end
	end
end