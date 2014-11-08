class AnalyzeController < ApplicationController
	def index
		text = params[:text]
		sentences = text.split('.')
		render :json => text
	end
end
