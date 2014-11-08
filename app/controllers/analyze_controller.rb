class AnalyzeController < ApplicationController
	def index
		text = params[:text]
		sentences = text.split(/[.?!]/)
		disputes = Dispute.all.sort{ |x, y| -((x.policy_text.split(/[.?!]/) & sentences).count <=> (y.policy_text.split(/[.?!]/) & sentences).count )}.first(5)
		rendertext = disputes.policy_text
		clauses = []
		disputes.each do |d|
			clauses << Clause.where(:dispute_id => d.id)[0].clause_text
		end

		clauses.each do |c|
			rendertext.gsub(rendertext, '<mark style = "background-color: red">'+rendertext+'</mark>')
		end

		render :inline => rendertext
	end
end
