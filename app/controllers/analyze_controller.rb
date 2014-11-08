class AnalyzeController < ApplicationController
	def index
		text = params[:text]
		sentences = text.split(/[.?!]/)
		disputes = Dispute.all.sort{ |x, y| (x.policy_text.split(/[.?!]/) & sentences).count <=> (y.policy_text.split(/[.?!]/) & sentences).count }
		render :json => disputes
	end
end
