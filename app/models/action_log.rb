class ActionLog < ActiveRecord::Base
	def self.search user_n , noticee
		if user_n.nil? && noticee.nil?
			all
		else
			where('username LIKE ?   AND notice LIKE ? ', "%#{user_n}%" , "%#{noticee}%")
		end
	end
end