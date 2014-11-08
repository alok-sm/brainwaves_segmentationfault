class AnalyzeController < ApplicationController
	def index
		text = params[:text]
		sentences = text.split(/[.?!]/)
		disputes = Dispute.all.sort{ |x, y| -((x.policy_text.split(/[.?!]/) & sentences).count <=> (y.policy_text.split(/[.?!]/) & sentences).count )}.first(5)
		rendertext = disputes[0].policy_text
		clauses = []
		disputes.each do |d|
			cl = Clause.where(:dispute_id => d.id)[0]
			if not cl.nil?
				clauses << cl.clause_text
			end
		end

		clauses.each do |c|
			text = text.gsub(c, '<mark style = "background-color: red">'+c+'</mark>')
		end
		# raise 'a'
		render :inline => text
	end
end
