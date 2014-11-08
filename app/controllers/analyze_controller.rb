class AnalyzeController < ApplicationController
	def index
		text = params[:text]
		sentences = text.split(/[.?!]/)
		disputes = Dispute.all
		match = nil
		max = 0
		disputes.each do |dispute|
		mnum = (dispute.policy_text.split(/[.?!]/) & sentences).count
			if( mnum >  max)
				match = dispute.policy_name
				max = mnum
			end
		end



		render :json => match
	end
end
