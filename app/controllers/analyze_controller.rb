class AnalyzeController < ApplicationController
	def index
		text = params[:text]
		sentences = text.split(/[.?!]/)
		disputes = Disputes.all
		match = nil
		max = 0
		disputes.each do |dispute|
		mnum = (dispute.policy_text.split(/[.?!]/) & sentences).count
			if( mnum >  max)
				match = dispute
				max = mnum
			end
		end

		
		
		render :json => text
	end
end
