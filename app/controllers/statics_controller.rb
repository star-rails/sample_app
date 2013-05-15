class StaticsController < ApplicationController
	def home
	end

	def help
	end

	def about
	end

	def create
	   static=Static.new(params[:static])	
	   if static.save then
	   	redirect_to show_static_path
	   else
	   	render "new"
	   end
    end

    def new
	   @static = Static.new
	end

	def show
		@statics=Static.all
		@static = Static.find params[:id] if params[:id]
		# @static = Static.where(id: params[:id]).first
	end

	# def showcontent
	# 	@static=Static.find(params[:id])
	# end
end
