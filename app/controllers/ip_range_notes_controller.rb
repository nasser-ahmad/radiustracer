class IpRangeNotesController < ApplicationController

	before_action :logged_in_user
	before_action :find_ip_range
	
	def index
		@ip_range_notes = @ip_range.ip_range_notes
	end
	def new
		@ip_range_note = IpRangeNote.new
	end

	def create
		@ip_range_note = IpRangeNote.new(note_params)

		if @ip_range_note.save
			notice = 'تمت إضافة ملاحظة ' + @ip_range_note.note + ' على المزود ' + @ip_range_note.ip_range.ip_range + ' بنجاح'
			ActionLog.create(username: current_user.name , action_type: 1 , finished: :true, notice: notice)
			flash[:success] = "تمت إضافة مالحظة جديدة على مجال عناوين المزود"
			redirect_to ip_range_path(@ip_range)
		else
			render 'new'
		end
	end

	def edit
		@ip_range_note = IpRangeNote.find(params[:id])
	end

	def update
		@ip_range_note = IpRangeNote.find(params[:id])
		if @ip_range_note.update(note_params)
			notice = 'تم تحديث ملاحظة على مجال العنواين ' + @ip_range_note.ip_range.ip_range
			ActionLog.create(username: current_user.name , action_type: 2 , finished: :true, notice: notice)
			flash[:success] = 'تم تحديث ملاحظة على مجال العناوين'
			redirect_to ip_range_path(@ip_range)
		else
			render 'edit'
		end
	end

	def delete
		@ip_range = IpRangeNote.find(params[:id])
	end

	def destroy
		ip_range_notee = IpRangeNote.find(params[:id])
		ip_range = IpRangeNote.find(params[:id]).ip_range.ip_range
		if IpRangeNote.find(params[:id]).destroy
			notice = 'تم حذف ملاحظة ' + ip_range_notee + ' من مجال العناوين ' + ip_range
			ActionLog.create(username: current_user.name , action_type: 3 , finished: :true, notice: notice)
			flash[:success] = 'تم حذف ملاحظة من مجال العناوين'
			redirect_to ip_range_path(@ip_range)
		end
	end

	private

		def note_params
			params.require(:ip_range_note).permit(:ip_range_id,:note)
		end

		def find_ip_range
			@ip_range = IpRange.find(params[:ip_range_id])
		end

end