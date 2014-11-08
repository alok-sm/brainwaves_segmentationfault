class AnalyzeController < ApplicationController
	def text
		text = params[:text]
		p text
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
		sentences = text.split(/[.?!]/)
		dispute = Dispute.all.sort{ |x, y| -((x.policy_text.split(/[.?!]/) & sentences).count <=> (y.policy_text.split(/[.?!]/) & sentences).count )}[0]
		puts "$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$"
		puts dispute.id
		puts "$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$"
		# rendertext = disputes[0].policy_text
		clauses = Clause.where(:dispute_id => dispute.id)
		# disputes.each do |d|
		# 	cl = Clause.where(:dispute_id => d.id)[0]
		# 	if not cl.nil?
		# 		clauses << cl.clause_text
		# 	end
		# end
		puts "$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$"
		clauses.each do |c|
			puts c.clause_text
			text = text.gsub(c.clause_text, '<mark style = "background-color:'+c.clause_status+'">'+c.clause_text+'</mark>')
		end
		puts "$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$"
		# raise 'a'
		render :inline => text
	end
end
