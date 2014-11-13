class TagController < ApplicationController
	def show
		@tag = Tag.find params[:id]
		@lists = List.tagged_with(@tag.name)
	end
end