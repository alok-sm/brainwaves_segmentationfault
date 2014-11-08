class Dispute < ActiveRecord::Base
	has_many :claims
end
