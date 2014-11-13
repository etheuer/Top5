class ListsController < ApplicationController
	before_action :find_list, only: [:show, :edit, :update, :destroy, :upvote]
	before_action :authenticate_user!,except: [:index, :show]

	def index
		@lists = List.all.order("created_at DESC")
	end

	def show
	end

	def new
		@list = current_user.lists.build
		5.times { @list.list_items.build } 
	end

	def create 
		@list = current_user.lists.build(list_params)

		if @list.save
			redirect_to @list, notice: "Successfully created new List"
		else
			render 'new'
		end
	end

	def edit
	end

	def update
		if @list.update(list_params)
			redirect_to @list, notice: "List was successfully updated!"
		else
			render 'edit'
		end
	end

	def destroy
		@list.destroy
		redirect_to root_path
	end

	def upvote
		@list.upvote_by current_user
		redirect_to :back
	end

	def tagged
	  if params[:tag].present? 
	    @lists = List.tagged_with(params[:tag])
	  else 
	    @lists = List.postall
	  end  
	end

	private

	def list_params
		params.require(:list).permit(
									:image, :title, :description, :tag_list,
									list_items_attributes: [:id, :ranking, :title, :url, :description, :_destroy])
	end 

	def find_list
		@list = List.find(params[:id])
	end


end
