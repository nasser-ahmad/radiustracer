class IpRangesController < ApplicationController
	before_action :logged_in_user 
    before_action  :prepare_action, only: [:show, :edit, :update, :delete , :destroy]

	def index
		@isp = Isp.find(params[:isp_id])
		@ip_ranges = IpRange.where(:isp_id => @isp.id).paginate(:page => params[:page], per_page: 10)

	end

	def show

	end	
	
	def new
		@isp = Isp.find(params[:isp_id])		
		@ip_range = IpRange.new
	end

	def create
	  @ip_range = IpRange.new(ip_range_params)
	  @isp = Isp.find(params[:isp_id])			  		 
      if @ip_range.save
      	notice = 'تمت إضافة المجال ' + @ip_range.ip_range + ' إلى المزود ' + @isp.name + ' بنجاح'
      	ActionLog.create(username: current_user.name , action_type: 1 , finished: :true, notice: notice)
        flash[:success] = 'تمت إضافة المجال بنجاح'
        redirect_to isp_path(@isp)
	  else
	  	render 'new'
      end
	end




	def edit
	end

	def update
		@ip_range = IpRange.find(params[:id])
		if @ip_range.update(ip_range_params)
			notice = 'تم تعديل مجال العناوين ' + @ip_range.ip_range + ' على  المزود ' + @ip_range.isp.name + ' بنجاح'
			ActionLog.create(username: current_user.name , action_type: 2 , finished: :true, notice: notice)
			flash[:success] = 'تم تعديل المجال بنجاح'
			redirect_to isp_path(@isp)
		else
			render 'edit'
		end
	end

	def delete
	end

	def destroy
	end

	private

	  def ip_range_params
	    params.require(:ip_range).permit(:ip_range,:subnet_mask, :note, :isp_id , :ip_term)
	  end

	  def prepare_action
		@ip_range = IpRange.find(params[:id])
		@isp = Isp.find(@ip_range.isp_id)
	  end
end