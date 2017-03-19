class Live < ApplicationRecord
	 acts_as_taggable_on :tags      
	 has_many :joins
end
