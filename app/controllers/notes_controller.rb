class NotesController < ApplicationController

	before_action :logged_in_user
	before_action :find_isp 
	
	def index
		@isp_notes = Note.where(:isp_id => @isp.id)
	end
	def new
		@isp_note = Note.new
	end

	def create
		@isp_note = Note.new(note_params)

		if @isp_note.save
			flash[:success] = "Note info added successfuly"
			redirect_to isp_path(@isp)
		else
			render 'new'
		end
	end

	def edit
		@isp_note = Note.find(params[:id])
	end

	def update
		@isp_note = Note.find(params[:id])
		if @isp_note.update(note_params)
			flash[:success] = 'Note updated successfuly'
			redirect_to isp_path(@isp)
		else
			render 'edit'
		end
	end

	def delete
		@isp_note = Note.find(params[:id])
	end

	def destroy
		if Note.find(params[:id]).destroy
			flash[:success] = 'Note deleted successfuly'
			redirect_to isp_path(@isp)
		end
	end

	private

		def note_params
			params.require(:note).permit(:isp_id,:note)
		end

		def find_isp
			@isp = Isp.find(params[:isp_id])
		end
end