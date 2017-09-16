class ActionLogsController < ApplicationController
	before_action :logged_in_user , :user_is_admin
	def index
		@action_logs = ActionLog.search(params[:username], params[:notice] ).paginate(:page => params[:page], per_page: 6)
	end

end