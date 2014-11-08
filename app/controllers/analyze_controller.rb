class AnalyzeController < ApplicationController
	def text
		text = params[:text]
		process1(text)
	end

	def file
		p params
		u = Upload.new(:file => params[:file])
		u.save
		text = Yomu.new(u.file.path).text
		process1(text)
	end

	def process1(text)
		puts "$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$"
		puts text
		puts "$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$"
		sentences = text.split(/[.?!]/)
		dispute = Dispute.all.sort{ |x, y| -((x.policy_text.split(/[.?!]/) & sentences).count <=> (y.policy_text.split(/[.?!]/) & sentences).count )}[0]
		# rendertext = disputes[0].policy_text
		clauses = Clause.where(:dispute_id => dispute.id)
		# disputes.each do |d|
		# 	cl = Clause.where(:dispute_id => d.id)[0]
		# 	if not cl.nil?
		# 		clauses << cl.clause_text
		# 	end
		# end

		clauses.each do |c|
			text = text.gsub(c, '<mark style = "background-color: red">'+c+'</mark>')
		end
		# raise 'a'
		render :inline => text
	end
end
