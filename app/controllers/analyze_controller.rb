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
		writs = {
			'habeus corpus'=> 'To have a body',
			'certiorari'=> 'a writ seeking judicial review. It is issued by a superior court, directing an inferior court, tribunal, or other public authority to send the record of a proceeding for review.',
			'mandamus'=> 'Mandamus is a judicial remedy in the form of an order from a superior court, to any government subordinate court, corporation, or public authority—to do (or forbear from doing) some specific act which that body is obliged under law to do (or refrain from doing)—and which is in the nature of public duty, and in certain cases one of a statutory duty.',
			'procedendo'=> 'It is a writ that sends a case from an appellate court to a lower court with an order to proceed to judgment.',
			'writ of prohibition'=> 'A writ of prohibition is a writ directing a subordinate to stop doing something the law prohibits.',
			'quo warranto'=> 'Quo warranto (Medieval Latin for "by what warrant?") is a prerogative writ requiring the person to whom it is directed to show what authority they have for exercising some right or power (or "franchise") they claim to hold.'
		}
		puts "$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$"
		clauses.each do |c|
			puts c.clause_text
			if dispute.policy_link != ''
				text = text.gsub(c.clause_text, '<a href = "'+
					dispute.policy_link+
					'" target="_blank"><mark style = "background-color:'+
					c.clause_status+'">'+
					c.clause_text+
					'</mark></a>')
				puts text
			else
				text = text.gsub(c.clause_text, '<mark style = "background-color:'+
					c.clause_status+'">'+
					c.clause_text+
					'</mark>')
				puts text
			end			
		end

		writs.keys.each do |w|
			text = text.gsub(w, 
				'<button type="button" class="btn btn-default" data-toggle="popover" data-placement="top" title="'+
				writs[w]+
				'">'+
				w+
				'</button>'

			)
		end
		puts "$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$"
		# raise 'a'
		sleep(3)
		render :inline => text
	end
end
