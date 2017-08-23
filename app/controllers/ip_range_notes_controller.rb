class IpRangeNotesController < ApplicationController

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
			flash[:success] = "Ip Range Note info added successfuly"
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
			flash[:success] = 'Ip Range Note updated successfuly'
			redirect_to ip_range_path(@ip_range)
		else
			render 'edit'
		end
	end

	def delete
		@ip_range = IpRangeNote.find(params[:id])
	end

	def destroy
		if IpRangeNote.find(params[:id]).destroy
			flash[:success] = 'Ip Range Note deleted successfuly'
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